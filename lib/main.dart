import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplash_api/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Unsplash Api',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}