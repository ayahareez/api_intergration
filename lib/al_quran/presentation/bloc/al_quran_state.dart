part of 'al_quran_bloc.dart';

@immutable
abstract class AlQuranState {}

class AlQuranInitial extends AlQuranState {}

class AlQuranLoadingState extends AlQuranState {}

class AlQuranLoadedState extends AlQuranState {
  final AlQuranModel alQuranModel;

  AlQuranLoadedState({required this.alQuranModel});
}