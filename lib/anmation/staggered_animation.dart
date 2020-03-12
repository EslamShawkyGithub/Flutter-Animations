import 'package:flutter/material.dart';

class StaggeredAnimation extends StatefulWidget {
  @override
  _StaggeredAnimationState createState() => _StaggeredAnimationState();
}

class _StaggeredAnimationState extends State<StaggeredAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Alignment> _alignAnimation;
  Animation<BorderRadius> _radiusAnimation;
  Animation<double> _withAnimation;
  Animation<double> _heightAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..addListener(() {
            setState(() {});
          });

    _alignAnimation = Tween<Alignment>(
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, .20, curve: Curves.bounceOut),
      ),
    );

    _radiusAnimation = BorderRadiusTween(
        begin:BorderRadius.circular(50.0),end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.20, .40, curve: Curves.fastOutSlowIn)));

    _withAnimation = Tween<double>(
      begin: 100,end: 300).animate(CurvedAnimation(parent: _controller,
        curve: Interval(0.40, 0.70,curve: Curves.linear)));

    _heightAnimation = Tween<double>(
      begin: 100,end: 500).animate(CurvedAnimation(parent: _controller,
        curve: Interval(0.70, 1.0,curve: Curves.linear)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.orange,
        child: GestureDetector(
          onTap: (){
            _controller.forward();
          },
          child: Stack(
            children: <Widget>[
              Align(
                alignment: _alignAnimation.value,
                child: Container(
                  height: _heightAnimation.value,
                  width: _withAnimation.value,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: _radiusAnimation.value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
