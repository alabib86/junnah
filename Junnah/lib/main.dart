import 'package:flutter/material.dart';
import 'package:junnah/Quraan.dart';
import 'package:junnah/Surrah.dart';
import 'package:junnah/test.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuraanPage(),
      routes: {
        "quraan":(context)=>QuraanPage(),
      },
    );
  }
}
