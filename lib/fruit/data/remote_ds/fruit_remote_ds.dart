import 'dart:convert';

import 'package:http/http.dart';

import '../models/fruit_model.dart';
abstract class FruitRemoteDs {
  ///this function gets data about a fruit by the name of it
  Future<FruitModel> getFruitByName(String name);
}

class FruitRemoteDsImpl extends FruitRemoteDs {
  @override
  Future<FruitModel> getFruitByName(String name) async {
    var url = Uri.parse('https://www.fruityvice.com/api/fruit/$name');
    final response = await get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      FruitModel fruitModel = FruitModel.fromMap(jsonMap);
      return fruitModel;
    } else {
      throw Exception('Failed to fetch fruit');
    }
  }
}