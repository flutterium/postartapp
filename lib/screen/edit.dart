import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:postart_app/lang/ser_localizations.dart';
import 'package:postart_app/model/selected_index_notifier.dart';
import 'package:postart_app/widget/bottom_navigation_bar.dart';
import '../widget/resizable.dart';

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  final Color? appBarColor;
  final Color? bottomBarColor;
  double? height;
  double? width;
  EditPage({this.appBarColor, this.bottomBarColor, this.height, this.width});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  List<Widget>? multiwidget;
  int? lastIndex;
  int? selectedIndex;

  @override
  void initState() {
    multiwidget = [];
    lastIndex = 0;
    selectedIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    multiwidget!.clear();
    super.dispose();
  }

  Future<void> addImage(BuildContext context) async {
    int? index = context.read<SelectedIndex>().nextIndex;
    String imgUrl =
        'https://www.zeydankids.com/resimler/1014108980336ff43e671c414d9f375d.jpg';
    var response = await http.get(Uri.parse(imgUrl));
    var decodedImage = await decodeImageFromList(response.bodyBytes);
    int imgWidth = decodedImage.width;
    int imgHeight = decodedImage.height;
    print('Height : $imgHeight\nWidth : $imgWidth');
    setState(() {
      multiwidget!.add(GestureDetector(
        onTap: () {
          context.read<SelectedIndex>().changeSelectedIndex(index);
          print('index : $index');
        },
        child: Resizable(
            diameter: 20,
            index: index,
            height: 200,
            isImg: true,
            width: ((imgWidth / imgHeight) * 200).toDouble(),
            child: Image.network(imgUrl)),
      ));
      context.read<SelectedIndex>().incrementIndex();
    });
    context.read<SelectedIndex>().changeSelectedIndex(index);
  }

  Future<void> addText(BuildContext context) async {
    int? index = context.read<SelectedIndex>().nextIndex;
    String text = 'MOVEMENT BASKI 2LI TAKIM 3-6 yas 1004';
    setState(() {
      multiwidget!.add(GestureDetector(
        onTap: () {
          context.read<SelectedIndex>().changeSelectedIndex(index);
          print('index : $index');
        },
        child: Resizable(
            diameter: 15,
            index: index,
            isImg: false,
            height: 50,
            width: 150,
            child: Text(text)),
      ));
      context.read<SelectedIndex>().incrementIndex();
    });
    context.read<SelectedIndex>().changeSelectedIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          SerLocalizations.of(context)!.newTemp,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            ///[Kullanıcının 999 adet widget eklemeyeceğini varsayıyoruz. :) ]
            context.read<SelectedIndex>().changeSelectedIndex(999);
          },
          child: Container(
            color: Colors.white,
            width: widget.width,
            height: widget.height,
            child: RepaintBoundary(child: Stack(children: multiwidget!)),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        imgOnTap: () => addImage(context),
        textOnTap: () => addText(context),
      ),
    );
  }
}
