import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'QuraanPage.dart';
import 'models/quraan_model.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (context){
      return Quraan();
    },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const QuraanPage(),
        routes: {
          "quraan":(context)=>QuraanPage(),
        },
      ),
    );
  }
}
