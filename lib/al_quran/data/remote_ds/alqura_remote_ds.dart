import 'dart:convert';

import 'package:http/http.dart';

import '../models/alquran_model.dart';

abstract class AlQuranRemoteDs {
  ///this function gets the Surah by its order in AlQuran
  ///takes the number of the Surah as a parameter
  Future<AlQuranModel> getSurahByNum(int surahNum);

  ///this function gets the data about Surah by its order in AlQuran
  ///takes the number of the Surah as a parameter
  Future<AlQuranModel> getDataOfSurah(int surahNum);

  ///this function gets the Surah by its order in AlQuran
  ///takes the number of the Surah and edition as parameters
  Future<AlQuranModel> getSurahByNumEdition(int surahNum, String edition);
}

class AlQuranRemoteDsImpl extends AlQuranRemoteDs {
  @override
  Future<AlQuranModel> getDataOfSurah(int surahNum) async {
    var url = Uri.parse('http://api.alquran.cloud/v1/surah/$surahNum');
    var response = await get(url);
    if (response.statusCode == 200) {
      String responseBody = response.body;
      Map<String, dynamic> jsonMap = jsonDecode(responseBody);
      AlQuranModel alQuranModel = AlQuranModel.fromMap(jsonMap);
      return alQuranModel;
    } else {
      throw Exception('api access failed');
    }
  }

  @override
  Future<AlQuranModel> getSurahByNum(int surahNum) async {
    var url = Uri.parse('http://api.alquran.cloud/v1/surah/$surahNum');
    var response = await get(url);
    if (response.statusCode == 200) {
      String responseBody = response.body;
      Map<String, dynamic> jsonMap = jsonDecode(responseBody);
      AlQuranModel alQuranModel = AlQuranModel.fromMap(jsonMap);
      for (var ayah in jsonMap['data']['ayahs']) {
        final String text = ayah['text'];
        print('Text: $text');
        alQuranModel.ayahs.add(text);
      }
      return alQuranModel;
    } else {
      throw Exception('api access failed');
    }
  }

  @override
  Future<AlQuranModel> getSurahByNumEdition(
      int surahNum, String edition) async {
    var url = Uri.parse('http://api.alquran.cloud/v1/surah/$surahNum/$edition');
    var response = await get(url);
    if (response.statusCode == 200) {
      String responseBody = response.body;
      Map<String, dynamic> jsonMap = jsonDecode(responseBody);
      AlQuranModel alQuranModel = AlQuranModel.fromMap(jsonMap);
      return alQuranModel;
    } else {
      throw Exception('api access failed');
    }
  }
}