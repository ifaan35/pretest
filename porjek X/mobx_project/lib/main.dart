// main.dart
import 'package:flutter/material.dart';
import 'package:mobx_project/controllers/obx_controller.dart';
import 'package:mobx_project/pages/page1.dart';
import 'package:mobx_project/pages/page2.dart';
import 'package:mobx_project/pages/page3.dart';
import 'package:mobx_project/pages/page4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ObxController obxController = ObxController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/page1',
      routes: {
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(),
        '/page4': (context) => Page4(),
      },
      home: Page1(),
    );
  }
}
