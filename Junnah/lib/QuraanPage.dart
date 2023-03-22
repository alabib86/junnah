import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:junnah/SurrahPage.dart';
import 'package:provider/provider.dart';

import 'models/quraan_model.dart';

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
  void setState(VoidCallback fn) {
    context.read<Quraan>().clearSurrah();
    super.setState(fn);
  }
  @override
  void initState() {
    getSurahs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOmePage"),
      ),
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
                    return Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SurrahPage()));
                            setState(() {
                              for (int l = 0; l < snapshot.data['data']['surahs'][i]['ayahs'].length; l++){
                                String ayah = snapshot.data['data']['surahs'][i]['ayahs'][l]['text'];
                                context.read<Quraan>().addSurrah(ayah);
                              }
                              context.read<Quraan>().surrahName=snapshot.data['data']['surahs'][i]['name'];
                            });
                          },
                          child: Container(
                              width: 100,
                              height: 40,
                              padding: const EdgeInsets.all(5),
                              alignment: Alignment.center,
                              child: Text(
                                  "${snapshot.data['data']['surahs'][i]['name']}")),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    );
                  });
        },
      ),
    );
  }
}
