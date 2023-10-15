part of 'fruit_bloc.dart';

@immutable
abstract class FruitState {}

class FruitInitial extends FruitState {}

class FruitLoadingState extends FruitState {}

class FruitLoadedState extends FruitState {
  final FruitModel fruitModel;

  FruitLoadedState({required this.fruitModel});
}