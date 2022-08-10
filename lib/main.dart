import 'dart:math';
import 'package:animation/animated_align.dart';
import 'package:animation/animated_defaulttextstyle.dart';
import 'package:animation/animated_padding.dart';
import 'package:animation/animated_positioned.dart';
import 'package:animation/custom_explicit_animation.dart';
import 'package:animation/explicit_animation.dart';
import 'package:animation/page_transition.dart';
import 'package:animation/tween_animation.dart';
import 'package:flutter/material.dart';

import 'animated_widget.dart';
import 'hero_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Animated Container & Curves & Animated Opacity

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: page_transition(),
      //Hero_Animation(),
      //Animated_Widget(),
      //Custom_Explicit_Animation(),
      //Explicit_Animation(),
      //Tween_Animation(),
      //Animated_DefaultTextStyle(),
      //Animated_Align(),
      // Animated_Padding(),
      //Animated_Positioned(),
      //MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool visible = true;
  double _width = 50;
  double _heigth = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              // يحدد سرعة الانتقال من الحالة الاولى الى الثانية خلال فترة زمنية محددة
              curve: Curves.linear,
              duration: const Duration(seconds: 2),
              width: _width,
              height: _heigth,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
            ),
            AnimatedOpacity(
              opacity: visible == true ? 1 : 0,
              duration: const Duration(seconds: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Reham'),
                  Text('Age : 20'),
                  Text('Employment : None'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.flip),
        onPressed: () {
          // تحديث القيم الاربعة
          setState(() {
            //Random : يولد قيم عشوائية
            Random random = Random();
            visible = !visible;
            _width = random.nextInt(300).toDouble();
            _heigth = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              visible == true ? 0 : 1,
            );
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
            //_width = (_width == 50 ? 200 : 50);
            //_heigth = (_heigth == 50 ? 200 : 50);
            //_color = (_color == Colors.green ? Colors.red : Colors.green);
            //_borderRadius = (_borderRadius == BorderRadius.circular(8)
            //    ? BorderRadius.circular(28)
            //    : BorderRadius.circular(8));
          });
        },
      ),
    );
  }
}
