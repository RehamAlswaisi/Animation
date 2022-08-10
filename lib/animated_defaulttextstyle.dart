import 'dart:math';

import 'package:flutter/material.dart';

class Animated_DefaultTextStyle extends StatefulWidget {
// Animated DefaultTextStyle

  @override
  State<Animated_DefaultTextStyle> createState() =>
      _Animated_DefaultTextStyleState();
}

class _Animated_DefaultTextStyleState extends State<Animated_DefaultTextStyle> {
  double _fontSize = 30;
  Color _color = Colors.red;
  FontWeight _fontWeight = FontWeight.bold;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(
              color: _color, fontSize: _fontSize, fontWeight: _fontWeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('My Text'),
              Text('My Text'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.flip),
        onPressed: () {
          Random random = Random();
          setState(() {
            _fontSize = random.nextInt(60).toDouble();
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);
            //_fontWeight = FontWeight.w400;
          });
        },
      ),
    );
  }
}
