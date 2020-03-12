import 'package:flutter/material.dart';
import 'dart:math'as math;

class WithoutAnimationBuilder extends StatefulWidget {



  @override
  _WithoutAnimationBuilderState createState() => _WithoutAnimationBuilderState();
}

class _WithoutAnimationBuilderState extends State<WithoutAnimationBuilder> with SingleTickerProviderStateMixin {

  CurvedAnimation _curvedAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 5));

    _curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn)
      ..addListener((
          ){
        setState(() {

        });
      });

    _animationController.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _animationController.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        _animationController.forward();
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
          child: Transform.rotate(
            angle: _curvedAnimation.value *2.0 *math.pi,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.deepPurple

            ),
          ),
        ),
      ),
    );
  }
}
