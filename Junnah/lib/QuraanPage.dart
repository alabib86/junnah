import 'package:flutter/material.dart';
import 'package:junnah/SurrahPage.dart';
import 'package:provider/provider.dart';
import 'models/quraan_model.dart';

class QuraanPage extends StatefulWidget {
  const QuraanPage({Key? key}) : super(key: key);

  @override
  State<QuraanPage> createState() => _QuraanPageState();
}

class _QuraanPageState extends State<QuraanPage> {

  @override
  void initState() {
    Quraan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HOmePage"),
        ),
        body: Consumer<Quraan>(
          builder: (context, model, child) {
            return
              model.isLoading==false
                ? const Center(child: CircularProgressIndicator())
                :
              ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: model.sModel.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SurrahPage(surahNum: i)));
                            },
                            child: Container(
                                width: 100,
                                height: 40,
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Text("${model.sModel[i].surahName}")),
                          ),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    });
          },
        ));
  }
}
