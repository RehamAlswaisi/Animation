import 'dart:math';

import 'package:flutter/material.dart';

class Animated_Widget extends StatefulWidget {
  // Animated Builder vs Animated Widget

  @override
  State<Animated_Widget> createState() => _Animated_WidgetState();
}

class _Animated_WidgetState extends State<Animated_Widget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = Tween<Size>(
            begin: const Size(200, 150), end: const Size(200, 350))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(),
      body: Center(
        child: Transform.scale(
          scale: 3,
          child: AnimatedBuilder(
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Click Me !',
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2),
                ),
              ),
              animation: _controller,
              builder: (ctx, child) => Transform.rotate(
                    angle: _controller.value * pi,
                    child: child,
                  )),
        ),
      ),
    );
  }
}

/*class OutlineButtonTransition extends AnimatedWidget {
  const OutlineButtonTransition({width}) : super(listenable: width);

  Animation<double> get width => listenable;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text('Click Me !'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: width.value ),
      ),
    );
  }
}*/
