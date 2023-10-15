part of 'dog_bloc.dart';

@immutable
abstract class DogState {}

class DogInitial extends DogState {}

class DogLoadingState extends DogState {}

class DogLoadedState extends DogState {
  final DogModel dogModel;

  DogLoadedState({required this.dogModel});
}