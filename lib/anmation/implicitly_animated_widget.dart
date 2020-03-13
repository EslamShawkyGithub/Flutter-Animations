import 'package:flutter/material.dart';

class AnimatedWidgets extends StatefulWidget {
  @override
  _AnimatedWidgetState createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidgets> {
  //double size=200;
  final dur = Duration(seconds: 1);
  bool isOn = false;
  final curve = Curves.decelerate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        child: Center(
          child: AnimatedContainer(
            curve: curve,
            decoration: BoxDecoration(
              color: isOn ?Colors.indigo:Colors.green,
              borderRadius: BorderRadius.circular(25),
            ),
            duration: dur,
            width: 200,
            height: 60,
            child: AnimatedAlign(
              duration: dur,
              alignment: isOn?Alignment.centerRight:Alignment.centerLeft,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    isOn =!isOn;
                  });
                },
                child: AnimatedContainer(
                  curve: curve,
                  decoration: BoxDecoration(
                    color: isOn ?Colors.green:Colors.indigo,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  duration: dur,
                  width: 48,
                  height: 48,
                ),
              ),
            ),
          ),
//          child: GestureDetector(
//            onTap: (){
//              setState(() {
//                size=300;
//              });
//            },
//            child: AnimatedContainer(
//              decoration: BoxDecoration(
//                color: Colors.red,
//                //shape: BoxShape.circle,
//                borderRadius: BorderRadius.circular(25),
//              ),
//
//              duration: Duration(seconds: 2),
//            width: size,
//            height: size,
//            ),
//          ),
        ),
      ),
    );
  }
}
