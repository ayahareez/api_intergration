part of 'dog_bloc.dart';

@immutable
abstract class DogEvent {}

class GetRandomDogImage extends DogEvent {}