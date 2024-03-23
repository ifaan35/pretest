import 'package:flutter/material.dart';
import 'package:flutter_application_10/app/data/colors.dart'; // Importing your custom color definitions
import 'package:get/get.dart';
import 'app/routes/app_pages.dart'; // Importing your application routes

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: const AppBarTheme(color: AppColors.backgroundColor),
      ),
    ),
  );
}
