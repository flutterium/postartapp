import 'package:flutter/material.dart';

class Ball extends StatefulWidget {
  final Function? onDrag;
  final bool? isBall;
  final int? diameter;

  Ball({Key? key, this.onDrag, this.isBall, this.diameter});

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  double? initX;
  double? initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag!(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: widget.isBall!
          ? Container(
              width: widget.diameter!.toDouble(),
              height: widget.diameter!.toDouble(),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            )
          : Icon(Icons.open_with_sharp, color: Colors.red),
    );
  }
}
