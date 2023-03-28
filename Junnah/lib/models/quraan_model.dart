import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:junnah/models/surah_model.dart';

class Quraan with ChangeNotifier {
  List<SurahModel> sModel = [];
  bool isLoading = false;

  Quraan() {
    getData();
  }

  getData() async {
    var url = Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani");

    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var i in responseBody['data']['surahs']) {
        sModel.add(SurahModel.fromMap(i));
      }
      isLoading = true;
      notifyListeners();
    }
  }

}

