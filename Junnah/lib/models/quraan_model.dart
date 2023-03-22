import 'package:flutter/material.dart';


class Quraan with ChangeNotifier {

  List<String> completeQuraan = [];
  String? surrahName;

  void addSurrah(String ayah) {
    completeQuraan.add(ayah);
    notifyListeners();
  }

  void clearSurrah (){
    completeQuraan.clear();
  }
}
