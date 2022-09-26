import 'package:flutter/material.dart';
import 'package:todolistass/AddThings.dart';
import 'package:todolistass/splash.dart';

import 'HomePage.dart';
import 'ShowLists.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
