import 'package:flutter/material.dart';
import 'package:flutteranmations/anmation/implicitly_animated_widget.dart';
import 'package:flutteranmations/anmation/staggered_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:StaggeredAnimation(),
    );
  }
}
