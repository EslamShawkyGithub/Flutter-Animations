import 'package:flutter/material.dart';
import 'dart:math' as math;

class WithAnimationBuilder extends StatefulWidget {
  @override
  _WithAnimationBuilderState createState() => _WithAnimationBuilderState();
}

class _WithAnimationBuilderState extends State<WithAnimationBuilder>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    _curvedAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      } else if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: AnimatedBuilder(
              child: Container(
                color: Colors.red,
                width: 200,
                height: 200,
              ),
              animation: _curvedAnimation,
              builder: (BuildContext context, child) {
                return Transform.rotate(
                  angle: _animationController.value * 2.0 * math.pi,
                  child: child,
                );
              }),
        ),
      ),
    );
  }
}
