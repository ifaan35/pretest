// pages/page1.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_project/controllers/obx_controller.dart';

class Page1 extends StatelessWidget {
  final ObxController obxController = ObxController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1 - Obx for String'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => Center(
                child: Text(
                  obxController.text,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                obxController.toggleCase();
              },
              child: Text('Toggle Case'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              },
              child: Text('Go to Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
