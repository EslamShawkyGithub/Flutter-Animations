import 'package:flutter/material.dart';


class AnimationCircle extends StatefulWidget {

  @override
  _AnimationCircleState createState() => _AnimationCircleState();
}

class _AnimationCircleState extends State<AnimationCircle>with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _controller;
  double size=100.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(vsync: this,
      duration: Duration(seconds: 5),);

    final curvedAnimation = CurvedAnimation(
        parent: _controller, curve: Curves.easeInSine);
    Tween<double> tween = Tween<double>(begin: 100.0, end: 300.0);
    _animation = tween.animate(curvedAnimation)
      ..addListener(() {
        setState(() {
          size = _animation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:AnimationBuild(_animation),
      ),
    );
  }
}


class AnimationBuild extends AnimatedWidget {

  AnimationBuild(Animation<double> animation1):super(listenable:animation1);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation2 = listenable;
    return Container(
      width: animation2.value,
      height: animation2.value,
      decoration: BoxDecoration(color: Colors.indigo,shape: BoxShape.circle),
    );
  }
}
