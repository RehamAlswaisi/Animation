import 'dart:html';

import 'package:flutter/material.dart';

class Custom_Explicit_Animation extends StatefulWidget {
  // Custom Explicit Animation

  @override
  State<Custom_Explicit_Animation> createState() =>
      _Custom_Explicit_AnimationState();
}

class _Custom_Explicit_AnimationState extends State<Custom_Explicit_Animation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..repeat();
    _animation = Tween<Size>(
            begin: const Size(200, 150), end: const Size(200, 350))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    // تعادل سطر رقم 48
    /* _controller.addListener(() {
      setState(() {});
    }); */
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  double height = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (ctx, child) => FlutterLogo(size: _animation.value.height),
          ),
          ListTile(
            trailing: const Icon(Icons.arrow_forward),
            title: const Text("Forwaed"),
            tileColor: Colors.green,
            onTap: () {
              _controller.forward();
            },
          ),
          ListTile(
            trailing: const Icon(Icons.arrow_back),
            title: const Text("Back"),
            tileColor: Colors.red,
            onTap: () {
              _controller.reverse();
            },
          ),
        ],
      ),
    );
  }
}
