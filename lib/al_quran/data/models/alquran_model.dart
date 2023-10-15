class AlQuranModel {
  final int surah, numberOfAyahs;
  final String edition, englishName;
  List<String> ayahs;

  AlQuranModel(
      {required this.surah,
      required this.englishName,
      required this.edition,
      required this.numberOfAyahs,
      required this.ayahs});
  factory AlQuranModel.fromMap(Map<String, dynamic> map) => AlQuranModel(
        surah: map['data']["number"],
        edition: map['data']["edition"]['identifier'],
        englishName: map['data']['englishName'],
        numberOfAyahs: map['data']['numberOfAyahs'],
        ayahs: [],
      );
}