import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:junnah/Surrah.dart';

class QuraanPage extends StatefulWidget {
  const QuraanPage({Key? key}) : super(key: key);

  @override
  State<QuraanPage> createState() => _QuraanPageState();
}

class _QuraanPageState extends State<QuraanPage> {
  Future getSurahs() async {
    var url = Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani");

    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  @override
  void initState() {
    getSurahs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getSurahs(),
        builder: (context, snapshot) {
          return snapshot.data == null || snapshot.data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: snapshot.data['data']['surahs'].length,
                  // itemCount: 3,
                  itemBuilder: (context, i) {
                    return Quraan(
                      surahName:snapshot.data['data']['surahs'][i]['name'],
                      surahNum: snapshot.data['data']['surahs'][i]['number'],
                    );
                  });
        },
      ),
    );
  }
}

class Quraan extends StatelessWidget {
  final String surahName;
  final  int surahNum;

  const Quraan({Key? key, required this.surahName, required this.surahNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>SurrahPage(surahNum: surahNum,surahName: surahName,)));
          },
          child: Container(
              width: 100,
              height: 40,
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Text(surahName)),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
