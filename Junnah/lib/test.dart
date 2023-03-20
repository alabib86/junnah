import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class testP extends StatefulWidget {
  const testP({Key? key}) : super(key: key);

  @override
  State<testP> createState() => _testPState();
}

class _testPState extends State<testP> {
  Future getPost() async {
    var url = Uri.parse("http://api.alquran.cloud/v1/quran/quran-uthmani");

    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    // print('Response status: ${response.statusCode}');
    return responseBody;
  }

  @override
  void initState() {
    getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: getPost(),
          builder: (context, shot) {
            return shot.data == null || shot.data.isEmpty
                ? const CircularProgressIndicator()
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: shot.data['data']['surahs'][0]['ayahs'].length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          // Text("${shot.data['data']['surahs'][0]}"),
                          // Text("${shot.data['data']['surahs'][i]}"),
                          Divider(),
                          // Text("${shot.data['data']['surahs'][i]['name']}"),
                          // Text("${shot.data['data']['surahs'][i]['number']}"),
                          Text("${shot.data['data']['surahs'][0]['ayahs'][i]['text']}"),
                        ],
                      );
                    });
          },
        ),
      ),
    );
  }
}
