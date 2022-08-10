import 'package:flutter/material.dart';

class Animated_Align extends StatefulWidget {
  // Animated Align
  @override
  State<Animated_Align> createState() => _Animated_AlignState();
}

class _Animated_AlignState extends State<Animated_Align> {
  double dx = 0;
  double dy = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: AnimatedAlign(
        duration: const Duration(seconds: 1),
        alignment: Alignment(dx, dy),
        child: Container(
          height: 300,
          width: 300,
          color: Colors.yellow[200],
          child: const Center(
            child: FlutterLogo(size: 60),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.flip),
        onPressed: () {
          setState(() {
            dx = (dx == 0 ? 1 : 0);
            dy = (dy == 0 ? 1 : 0);
            ;
          });
        },
      ),
    );
  }
}
