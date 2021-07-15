import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postart_app/lang/ser_localizations.dart';
import 'package:postart_app/screen/edit.dart';
import 'package:postart_app/model/temp_size_model.dart';
import 'package:postart_app/theme/button_theme.dart';

class SelectTempSize extends StatefulWidget {
  @override
  _SelectTempSizeState createState() => _SelectTempSizeState();
}

class _SelectTempSizeState extends State<SelectTempSize> {
  List<TempSizeModel> tempSizeList = TempSizeModel.getTempSizes();
  int selectedIndex = 0;

  void sizeChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Text(
                  SerLocalizations.of(context)!.selectTempSize,
                  style: TextStyle(fontSize: 27, color: Colors.white),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: tempSizeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Theme(
                      data: ThemeData(unselectedWidgetColor: Colors.white),
                      child: CheckboxListTile(
                        checkColor: Colors.white,
                        selectedTileColor: Colors.white,
                        title: Text(tempSizeList[index].title,
                            style: TextStyle(color: Colors.white)),
                        value: selectedIndex == index ? true : false,
                        onChanged: (bool? val) {
                          sizeChange(index);
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    );
                  }),
            ],
          ),
        ),
        floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => EditPage(
                              appBarColor: Colors.blue,
                              bottomBarColor: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: (tempSizeList[selectedIndex].height /
                                      tempSizeList[selectedIndex].width) *
                                  MediaQuery.of(context).size.width *
                                  0.9,
                            )),
                  );
                },
                child: Text(SerLocalizations.of(context)!.continueText,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    )))),
      ),
    );
  }
}
