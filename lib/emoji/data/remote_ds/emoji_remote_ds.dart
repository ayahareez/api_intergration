import 'dart:convert';

import 'package:http/http.dart';

import '../models/emoji_random_model.dart';

abstract class EmojiRemoteDs {
  ///this function gets Emoji by its category and and categoryName as
  ///category/travel-and-places or group/animal-bird
  Future<EmojiRandomModel> getEmojiByName(String category, String categoryName);

  ///this function gets Emoji randomly
  ///takes no parameters
  Future<EmojiRandomModel> getRandomEmoji();
}

class EmojiRemoteDsImpl extends EmojiRemoteDs {
  @override
  Future<EmojiRandomModel> getEmojiByName(
      String category, String categoryName) async {
    var url = Uri.parse(
        'https://emojihub.yurace.pro/api/random/$category/$categoryName');
    final response = await get(url);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      EmojiRandomModel emojiRandomModel = EmojiRandomModel.fromMap(jsonMap);
      return emojiRandomModel;
    } else {
      throw Exception('Failed to fetch emoji');
    }
  }

  @override
  Future<EmojiRandomModel> getRandomEmoji() async {
    var url = Uri.parse('https://emojihub.yurace.pro/api/random');
    final response = await get(url);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      EmojiRandomModel emojiRandomModel = EmojiRandomModel.fromMap(jsonMap);
      return emojiRandomModel;
    } else {
      throw Exception('Failed to fetch emoji');
    }
  }
}