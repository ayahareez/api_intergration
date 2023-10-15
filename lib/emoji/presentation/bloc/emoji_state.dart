part of 'emoji_bloc.dart';

@immutable
abstract class EmojiState {}

class EmojiInitial extends EmojiState {}

class EmojiLoadingState extends EmojiState{}

class EmojiLoadedState extends EmojiState{
  final EmojiRandomModel emojiRandomModel;

  EmojiLoadedState({required this.emojiRandomModel});

}