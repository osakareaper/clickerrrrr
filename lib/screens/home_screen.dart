import 'package:clicker/widgets/movable_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final initialX = constraints.maxWidth / 2 - 28;
          final initialY = constraints.maxHeight / 2 - 28;

          return Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text('u clickeddddd:'),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
              MovableButton(
                onPressed: _incrementCounter,
                label: 'CLICK!',
                initialX: initialX,
                initialY: initialY,
              ),
            ],
          );
        },
      ),
    );
  }
}
