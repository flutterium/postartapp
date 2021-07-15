import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:postart_app/model/selected_index_notifier.dart';

import 'ball.dart';

// ignore: must_be_immutable
class Resizable extends StatefulWidget {
  final Widget? child;
  final bool? isImg;
  int? index;
  int? diameter;
  double? height;
  double? width;
  Resizable(
      {this.child,
      this.isImg,
      this.index,
      this.diameter = 20,
      this.height,
      this.width});
  @override
  _ResizableState createState() => _ResizableState();
}

class _ResizableState extends State<Resizable> {
  double top = 0;
  double left = 0;
  double zoom = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: Transform.scale(
            scale: zoom,
            child: Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: widget.index! ==
                              context.watch<SelectedIndex>().selectedIndex
                          ? Colors.red
                          : Colors.transparent),
                  color: Colors.transparent),
              child: widget.child,
            ),
          ),
        ),

        ///[TOP LEFT]
        Positioned(
          top: top -
              (widget.height! * zoom - widget.height!) / 2 -
              widget.diameter! / 2,
          left: left -
              (widget.width! * zoom - widget.width!) / 2 -
              widget.diameter! / 2,
          child: widget.index! == context.watch<SelectedIndex>().selectedIndex
              ? widget.isImg!
                  ? Ball(
                      diameter: widget.diameter!,
                      isBall: true,
                      onDrag: (dx, dy) {
                        var mid = dx + dy;
                        var zoomRate = (widget.width! + widget.height! - mid) /
                            (widget.width! + widget.height!);
                        setState(() {
                          zoom = zoom * pow(zoomRate, 2);
                        });
                      },
                    )
                  : SizedBox()
              : SizedBox(),
        ),

        ///[TOP MIDDLE]
        Positioned(
          top: top -
              (widget.height! * zoom - widget.height!) / 2 -
              widget.diameter! / 2,
          left: left + widget.width! / 2 - widget.diameter! / 2,
          child: !widget.isImg!
              ? widget.index! == context.watch<SelectedIndex>().selectedIndex
                  ? Ball(
                      diameter: widget.diameter!,
                      isBall: true,
                      onDrag: (dx, dy) {
                        var newHeight = widget.height! - dy;

                        setState(() {
                          widget.height = newHeight > 0 ? newHeight : 0;
                          top = top + dy;
                        });
                      },
                    )
                  : SizedBox()
              : SizedBox(),
        ),

        ///[TOP RIGHT]
        Positioned(
          top: top -
              (widget.height! * zoom - widget.height!) / 2 -
              widget.diameter! / 2,
          left: left +
              (widget.width! * zoom - widget.width!) / 2 +
              widget.width! -
              widget.diameter! / 2,
          child: widget.index! == context.watch<SelectedIndex>().selectedIndex
              ? widget.isImg!
                  ? Ball(
                      diameter: widget.diameter!,
                      isBall: true,
                      onDrag: (dx, dy) {
                        var mid = (-dx + dy);
                        var zoomRate = (widget.width! + widget.height! - mid) /
                            (widget.width! + widget.height!);

                        setState(() {
                          zoom = zoom * pow(zoomRate, 2);
                        });
                      },
                    )
                  : SizedBox()
              : SizedBox(),
        ),

        ///[CENTER RIGHT]
        Positioned(
          top: top + widget.height! / 2 - widget.diameter! / 2,
          left: left +
              (widget.width! * zoom - widget.width!) / 2 +
              widget.width! -
              widget.diameter! / 2,
          child: !widget.isImg!
              ? widget.index! == context.watch<SelectedIndex>().selectedIndex
                  ? Ball(
                      diameter: widget.diameter!,
                      isBall: true,
                      onDrag: (dx, dy) {
                        var newWidth = widget.width! + dx;

                        setState(() {
                          widget.width = newWidth > 0 ? newWidth : 0;
                        });
                      },
                    )
                  : SizedBox()
              : SizedBox(),
        ),

        ///[BOTTOM RIGHT]
        Positioned(
          top: top +
              (widget.height! * zoom - widget.height!) / 2 +
              widget.height! -
              widget.diameter! / 2,
          left: left +
              (widget.width! * zoom - widget.width!) / 2 +
              widget.width! -
              widget.diameter! / 2,
          child: widget.index! == context.watch<SelectedIndex>().selectedIndex
              ? widget.isImg!
                  ? Ball(
                      diameter: widget.diameter!,
                      isBall: true,
                      onDrag: (dx, dy) {
                        var mid = (-dx - dy);
                        var zoomRate = (widget.width! + widget.height! - mid) /
                            (widget.width! + widget.height!);
                        setState(() {
                          zoom = zoom * pow(zoomRate, 2);
                        });
                      },
                    )
                  : SizedBox()
              : SizedBox(),
        ),

        ///[BOTTOM CENTER]
        Positioned(
          top: top +
              (widget.height! * zoom - widget.height!) / 2 +
              widget.height! -
              widget.diameter! / 2,
          left: left + widget.width! / 2 - widget.diameter! / 2,
          child: !widget.isImg!
              ? widget.index! == context.watch<SelectedIndex>().selectedIndex
                  ? Ball(
                      diameter: widget.diameter!,
                      isBall: true,
                      onDrag: (dx, dy) {
                        var newHeight = widget.height! + dy;

                        setState(() {
                          widget.height = newHeight > 0 ? newHeight : 0;
                        });
                      },
                    )
                  : SizedBox()
              : SizedBox(),
        ),

        ///[BOTTOM LEFT]
        Positioned(
          top: top +
              (widget.height! * zoom - widget.height!) / 2 +
              widget.height! -
              widget.diameter! / 2,
          left: left -
              (widget.width! * zoom - widget.width!) / 2 -
              widget.diameter! / 2,
          child: widget.index! == context.watch<SelectedIndex>().selectedIndex
              ? widget.isImg!
                  ? Ball(
                      diameter: widget.diameter!,
                      isBall: true,
                      onDrag: (dx, dy) {
                        var mid = (dx - dy);
                        var zoomRate = (widget.width! + widget.height! - mid) /
                            (widget.width! + widget.height!);
                        setState(() {
                          zoom = zoom * pow(zoomRate, 2);
                        });
                      },
                    )
                  : SizedBox()
              : SizedBox(),
        ),

        ///[LEFT CENTER]
        Positioned(
          top: top + widget.height! / 2 - widget.diameter! / 2,
          left: left -
              (widget.width! * zoom - widget.width!) / 2 -
              widget.diameter! / 2,
          child: !widget.isImg!
              ? widget.index! == context.watch<SelectedIndex>().selectedIndex
                  ? Ball(
                      diameter: widget.diameter!,
                      isBall: true,
                      onDrag: (dx, dy) {
                        var newWidth = widget.width! - dx;

                        setState(() {
                          widget.width = newWidth > 0 ? newWidth : 0;
                          left = left + dx;
                        });
                      },
                    )
                  : SizedBox()
              : SizedBox(),
        ),

        ///[CENTER]
        Positioned(
          top: top + widget.height! / 2 - widget.diameter! / 2,
          left: left + widget.width! / 2 - widget.diameter! / 2,
          child: widget.index! == context.watch<SelectedIndex>().selectedIndex
              ? Ball(
                  diameter: widget.diameter!,
                  isBall: false,
                  onDrag: (dx, dy) {
                    setState(() {
                      top = top + dy;
                      left = left + dx;
                    });
                  },
                )
              : SizedBox(),
        ),
      ],
    );
  }
}
