import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> animationTween ;
  Animation<Color> animationColor ;

  double size = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(vsync: this,
    duration: Duration(seconds: 5),);

    ColorTween colorTween = ColorTween(begin:Colors.red,end: Colors.yellow );
    animationColor = colorTween.animate(_controller)..addListener((){
      setState(() {

      });
    });

    final curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    Tween<double> tween = Tween<double>(begin: 100.0,end: 300.0);
    animationTween = tween.animate(curvedAnimation)..addListener((){
      setState(() {
        size=animationTween.value;
      });
    });
    // just Tween without Curved animation
//    Tween<double> tween = Tween<double>(begin: 100.0,end: 300.0);
//    animationTween = tween.animate(_controller)..addListener((){
//      setState(() {
//        size=animationTween.value;
//      });
//    });
    //_controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: GestureDetector(
          onTap: (){
            if(_controller.status==AnimationStatus.completed){
              _controller.reverse();
            }
            else{
              _controller.forward();
            }
          },
          child: Container(
            color: animationColor.value,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
