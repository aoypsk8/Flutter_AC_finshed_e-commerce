import 'package:flutter/material.dart';
import 'package:flutter_lab_ac/pages/HomePage.dart';
import 'package:flutter_lab_ac/pages/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: DashboardPage()
    );
  }
}
