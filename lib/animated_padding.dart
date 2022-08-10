import 'package:flutter/material.dart';

class Animated_Padding extends StatefulWidget {
  // Animated Padding

  @override
  State<Animated_Padding> createState() => _Animated_PaddingState();
}

class _Animated_PaddingState extends State<Animated_Padding> {
  double padValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 500),
          padding: EdgeInsets.all(padValue),
          child: Container(
            color: Colors.blue,
            height: 200,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.flip),
        onPressed: () {
          setState(() {
            padValue = (padValue == 0 ? 25 : 0);
          });
        },
      ),
    );
  }
}
