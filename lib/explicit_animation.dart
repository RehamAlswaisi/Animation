import 'package:flutter/material.dart';

class Explicit_Animation extends StatefulWidget {
  const Explicit_Animation({Key? key}) : super(key: key);

  @override
  State<Explicit_Animation> createState() => _Explicit_AnimationState();
}

// SingleTickerProviderStateMixin : حتى نحصل على خصائص اضافية
class _Explicit_AnimationState extends State<Explicit_Animation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //DefaultTextStyleTransition
  late Animation<TextStyle> _animation;

  //DecoratedBoxTransition
  //late Animation<Decoration> _animation;

  // SlideTransition
  //late Animation<Offset> _animation;

  // AlignTransition
  //late Animation<AlignmentGeometry> _animation;

  //late Animation<double> _animation;

  final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(),
        borderRadius: BorderRadius.zero,
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow>[
          BoxShadow(),
        ]),
    end: BoxDecoration(
        color: Colors.black,
        border: Border.all(),
        borderRadius: BorderRadius.zero,
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow>[
          BoxShadow(),
        ]),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      //lowerBound: 0.6,
      //upperBound: 1
    )..repeat(
        // يدعم الاتجاه المعاكس
        reverse: true,
        min: 0);
    _animation = //DefaultTextStyleTransition
        TextStyleTween(
                begin: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 45),
                end: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 85))
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.linear));

    //DecoratedBoxTransition
    /* DecorationTween(
                begin: BoxDecoration(color: Colors.red),
                end: BoxDecoration(color: Colors.blue))
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.linear));*/

    // SlideTransition
    /*Tween<Offset>(begin: Offset(0, 0), end: Offset(1, 1)).animate(
            CurvedAnimation(parent: _controller, curve: Curves.linear));*/

    // AlignTransition
    /*Tween<AlignmentGeometry>(
            begin: Alignment.bottomRight, end: Alignment.topLeft)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));*/

    // double
    // _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);*/
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: DefaultTextStyleTransition(
          style: _animation,
          // 7-
          //DecoratedBoxTransition(
          //_animation :decoration لازم يكون نوعها
          //decoration: _decorationTween.animate(_controller),
          // 6-
          //SlideTransition(
          //_animation :offset لازم يكون نوعها
          //position: _animation,
          // 5-
          //AlignTransition(
          //_animation :AlignmentGeometry لازم يكون نوعها
          //alignment: _animation,
          // 4- التلاشي
          // FadeTransition(
          //opacity: _animation,
          // 3-
          //SizeTransition(
          //sizeFactor: _animation,
          //axis: Axis.horizontal,
          // 2-
          //ScaleTransition(
          //scale: _animation,
          // 1-
          //RotationTransition(
          //turns: _animation,
          child: const Padding(padding: EdgeInsets.all(8), child: Text('Text')
              /*FlutterLogo(
              size: 150,
            ),*/
              ),
        ),
      ),
    );
  }
}
