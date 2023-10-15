import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../data/models/fruit_model.dart';
import '../../data/remote_ds/fruit_remote_ds.dart';

part 'fruit_event.dart';
part 'fruit_state.dart';

class FruitBloc extends Bloc<FruitEvent, FruitState> {
  FruitBloc() : super(FruitInitial()) {
    on<FruitEvent>((event, emit) async {
      if(event is GetFruitByName){
        emit(FruitLoadingState());
        FruitModel fruitModel= await FruitRemoteDsImpl().getFruitByName(event.fruitName);
        emit(FruitLoadedState(fruitModel: fruitModel));
      }
    });
  }
}