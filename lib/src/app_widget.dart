import 'package:flutter/material.dart';
import 'package:slidy_flutter_challenge_01/src/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge 01',
      home: HomeModule(),
    );
  }
}
