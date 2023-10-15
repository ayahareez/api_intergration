import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../data/models/alquran_model.dart';
import '../../data/remote_ds/alqura_remote_ds.dart';

part 'al_quran_event.dart';
part 'al_quran_state.dart';

class AlQuranBloc extends Bloc<AlQuranEvent, AlQuranState> {
  AlQuranBloc() : super(AlQuranInitial()) {
    on<AlQuranEvent>((event, emit) async {
      if (event is GetSurahByNumber) {
        emit(AlQuranLoadingState());
        AlQuranModel alQuranModel =
            await AlQuranRemoteDsImpl().getSurahByNum(event.surahNum);
        emit(AlQuranLoadedState(alQuranModel: alQuranModel));
      }
    });
  }
}