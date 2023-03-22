import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/quraan_model.dart';

class SurrahPage extends StatefulWidget {


  const SurrahPage({Key? key }) : super(key: key);


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

    return Scaffold(
      appBar: AppBar(title: Text("${context.read<Quraan>().surrahName}"),),
      body: Center(
        child:ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: context.read<Quraan>().completeQuraan.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text("${context.read<Quraan>().completeQuraan[i]}",textDirection: TextDirection.rtl),
                      ],
                    ),
                  );
                })
      ),
    );
  }
}


