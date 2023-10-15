part of 'fruit_bloc.dart';

@immutable
abstract class FruitEvent {}
class GetFruitByName extends FruitEvent{
  final String fruitName;
  GetFruitByName({required this.fruitName});
}