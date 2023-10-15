import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../data/models/dog_model.dart';
import '../../data/remote_ds/dog_remote_ds.dart';



part 'dog_event.dart';
part 'dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  DogBloc() : super(DogInitial()) {
    on<DogEvent>((event, emit) async {
      if (event is GetRandomDogImage) {
        emit(DogLoadingState());
        DogModel dogModel = await DogRemoteDsImpl().fetchRandomDogImage();
        emit(DogLoadedState(dogModel: dogModel));
      }
    });
  }
}