class SurahModel {
  SurahModel({
    this.surahNum,
    this.surahName,
    this.ayat
  });

  String? surahName;
  int? surahNum;
  List<dynamic>? ayat;


  factory SurahModel.fromMap(Map<String, dynamic> json) => SurahModel(
    surahName: json['name'], surahNum: json['number'],
    ayat: json['ayahs']
  );

}
