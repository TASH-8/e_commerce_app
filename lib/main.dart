// ignore_for_file: unused_import

import 'package:e_commerce_app/features/forget_reset/presentation/pages/forgot_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/homescreen.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/customCategoryBtn.dart';
import 'package:e_commerce_app/features/login/presentation/pages/login_page.dart';
import 'package:e_commerce_app/features/signup/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen() 
    );
  }
}
