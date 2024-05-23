import 'package:flutter/material.dart';

class MovableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;

  MovableButton({required this.onPressed, required this.label});

  @override
  _MovableButtonState createState() => _MovableButtonState();
}

class _MovableButtonState extends State<MovableButton> {
  double xPosition = 0;
  double yPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: xPosition,
      top: yPosition,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            xPosition += details.delta.dx;
            yPosition += details.delta.dy;
          });
        },
        child: FloatingActionButton(
          onPressed: widget.onPressed,
          child: Text(widget.label),
        ),
      ),
    );
  }
}
