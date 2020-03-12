import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimationBasic extends StatefulWidget {
  @override
  _AnimationBasicState createState() => _AnimationBasicState();
}

class _AnimationBasicState extends State<AnimationBasic> with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,
    duration: Duration(seconds: 1),lowerBound: 60.0,upperBound: 220.0,
    );

    _animationController.addListener((){
      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: GestureDetector(
            onTap: (){
              if(_animationController.status==AnimationStatus.completed){
                _animationController.reverse();
              }
              else {
                _animationController.forward();
              }
            },
            child: FlutterLogo(
              size: _animationController.value,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
}
