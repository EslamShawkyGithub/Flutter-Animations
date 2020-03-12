import 'package:flutter/material.dart';

class TweenSequance extends StatefulWidget {
  @override
  _TweenSequanceState createState() => _TweenSequanceState();
}

class _TweenSequanceState extends State<TweenSequance>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Alignment> _animationAlignment;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    final curve =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);

    final align1 = AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight);
    final align2 = AlignmentTween(begin: Alignment.bottomRight, end: Alignment.bottomLeft);
    final align3 = AlignmentTween(begin: Alignment.bottomLeft, end: Alignment.topRight);
    final align4 = AlignmentTween(begin: Alignment.topRight, end: Alignment.center);

    final alignSequance = TweenSequence<Alignment>(
      [
        TweenSequenceItem(tween: align1, weight: 1.0),
        TweenSequenceItem(tween: align2, weight: 1.0),
        TweenSequenceItem(tween: align3, weight: 1.0),
        TweenSequenceItem(tween: align4, weight: 1.0),

      ]
    );
    _animationAlignment = alignSequance.animate(curve);

//    _animationController.addStatusListener((status) {
//      if (status == AnimationStatus.dismissed) {
//        _animationController.forward();
//      }

//      else if (status == AnimationStatus.completed) {
//        _animationController.reverse();
//      }
 //   });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: (){
            _animationController.forward();
          },
          child: Stack(
            children: <Widget>[
               AnimatedBuilder(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orange),
                ),
                  animation: _animationAlignment,
                  builder: (BuildContext context , child){
                  return Align(
                    alignment: _animationAlignment.value,
                    child: child,
                  );
                  }
                  ),
          ],
            ),
          ),
        ),
    );
  }
}
