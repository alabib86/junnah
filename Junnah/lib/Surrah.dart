import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SurrahPage extends StatefulWidget {


  const SurrahPage({Key? key, required this.surahNum, required this.surahName, }) : super(key: key);

  final int surahNum;
  final String surahName;
  @override
  State<SurrahPage> createState() => _SurrahPageState();
}

class _SurrahPageState extends State<SurrahPage> {

  Future getSurrah() async {

    var url = Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani");

    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }


  @override
  void initState() {
    getSurrah();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.surahName),),
      body: Center(
        child: FutureBuilder(
          future: getSurrah(),
          builder: (context, shot) {
            return shot.data == null || shot.data.isEmpty
                ? const CircularProgressIndicator()
                : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: shot.data['data']['surahs'][widget.surahNum-1]['ayahs'].length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text("${shot.data['data']['surahs'][widget.surahNum-1]['ayahs'][i]['text']}",textDirection: TextDirection.rtl),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}


