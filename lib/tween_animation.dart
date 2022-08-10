import 'dart:math';

import 'package:flutter/material.dart';

class Tween_Animation extends StatefulWidget {
  // Tween Animation

  @override
  State<Tween_Animation> createState() => _Tween_AnimationState();
}

class _Tween_AnimationState extends State<Tween_Animation> {
  double _angle = 0;
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _angle),
              duration: const Duration(seconds: 1),
              child: Container(
                height: 200,
                width: 300,
                color: Colors.green,
              ),
              builder: (_, double angle, child) => Transform.rotate(
                angle: _angle,
                child: child,
              ),
            ),
            Text(
              '${(_value * (180 / pi)).round()}',
              style: const TextStyle(fontSize: 30),
            ),
            Slider(
              value: _value,
              onChanged: (val) => setState(
                () {
                  _value = val;
                  _angle = val;
                },
              ),
              min: 0,
              max: pi * 2,
              divisions: 4,
            )
          ],
        ),
      ),
    );
  }
}
