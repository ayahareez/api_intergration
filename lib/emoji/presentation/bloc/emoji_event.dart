part of 'emoji_bloc.dart';

@immutable
abstract class EmojiEvent {}

class GetRandomEmoji extends EmojiEvent {}

class GetEmojiByName extends EmojiEvent {
  final String category, categoryName;

  GetEmojiByName({required this.category, required this.categoryName});
}