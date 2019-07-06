import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:slidy_flutter_challenge_01/src/app_module.dart';

void main() {
  // change the duration of the animation, default value = 1.0
  // use for debug purpose
  timeDilation = 1.0;
  runApp(AppModule());
}
