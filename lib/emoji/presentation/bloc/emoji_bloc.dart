import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/emoji_random_model.dart';
import '../../data/remote_ds/emoji_remote_ds.dart';

part 'emoji_event.dart';
part 'emoji_state.dart';

class EmojiBloc extends Bloc<EmojiEvent, EmojiState> {
  EmojiBloc() : super(EmojiInitial()) {
    on<EmojiEvent>((event, emit) async {
      if(event is GetRandomEmoji){
        emit(EmojiLoadingState());
        EmojiRandomModel emojiRandomModel =await EmojiRemoteDsImpl().getRandomEmoji();
        emit(EmojiLoadedState(emojiRandomModel: emojiRandomModel));
      }
      else if(event is GetEmojiByName){
        emit(EmojiLoadingState());
        EmojiRandomModel emojiRandomModel =await EmojiRemoteDsImpl().getEmojiByName(event.category, event.categoryName);
        emit(EmojiLoadedState(emojiRandomModel: emojiRandomModel));
      }
    });
  }
}