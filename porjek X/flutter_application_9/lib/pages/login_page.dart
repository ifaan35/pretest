import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_9/pages/main_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your login form widgets here
            ElevatedButton(
              onPressed: () {
                Get.to(MainPage());
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/register');
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
