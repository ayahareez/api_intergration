import 'dart:convert';

import 'package:http/http.dart';
import '../models/dog_model.dart';

abstract class DogRemoteDs {
  ///this function gets a random image of dogs
  ///takes nothing as parameter and returns [Future<DogModel>]
  Future<DogModel> fetchRandomDogImage();
}

class DogRemoteDsImpl extends DogRemoteDs {
  @override
  final String baseUrl = 'https://random.dog/woof.json';

  @override
  Future<DogModel> fetchRandomDogImage() async {
    final response = await get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      DogModel dogModel = DogModel.fromMap(data);
      return dogModel;
    } else {
      throw Exception('Failed to load random dog image');
    }
  }
}