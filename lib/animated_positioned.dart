import 'dart:math';

import 'package:flutter/material.dart';

class Animated_Positioned extends StatefulWidget {
  // Animated Positioned
  @override
  State<Animated_Positioned> createState() => _Animated_PositionedState();
}

class _Animated_PositionedState extends State<Animated_Positioned> {
  //double _width = 50;
  //double _heigth = 50;
  Color _color = Colors.green;
  bool visible = true;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black12,
          ),
          const Center(
            child: Text(
              'My Text',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            bottom: visible == true ? 250 : 350,
            right: 100,
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                color: _color,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.flip),
        onPressed: () {
          setState(() {
            //Random : يولد قيم عشوائية
            Random random = Random();
            visible = !visible;
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              visible == true ? 0 : 1,
            );
            _borderRadius =
                BorderRadius.circular(random.nextInt(200).toDouble());
          });
        },
      ),
    );
  }
}
