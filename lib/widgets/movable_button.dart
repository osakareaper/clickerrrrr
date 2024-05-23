import 'package:flutter/material.dart';

class MovableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final double initialX;
  final double initialY;

  MovableButton({
    required this.onPressed,
     required this.label,
     required this.initialX,
     required this.initialY,
    });

  @override
  _MovableButtonState createState() => _MovableButtonState();
}

class _MovableButtonState extends State<MovableButton> {
  late double xPosition;
  late double yPosition;

  @override
  void initState() {
    super.initState();
    xPosition = widget.initialX;
    yPosition = widget.initialY;
  }

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
        child: SizedBox(
          width: 100,
          height: 100,
          child: FloatingActionButton(
          onPressed: widget.onPressed,
          backgroundColor: Colors.red,
          shape: const CircleBorder(),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
        ),
        ),
      ),
    );
  }
}
