import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/quraan_model.dart';

class SurrahPage extends StatefulWidget {
  final int surahNum;


  const SurrahPage({Key? key,required this.surahNum }) : super(key: key);


  @override
  State<SurrahPage> createState() => _SurrahPageState();
}

class _SurrahPageState extends State<SurrahPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Quraan>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: Text("${provider.sModel[widget.surahNum].surahName}"),),
          body: Center(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: provider.sModel[widget.surahNum].ayat!.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("${provider.sModel[widget.surahNum].ayat![i]['text']}", textDirection: TextDirection.rtl),
                        ],
                      ),
                    );
                  })
          ),
        );
      },
    );
  }
}


