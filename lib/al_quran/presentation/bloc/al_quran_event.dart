part of 'al_quran_bloc.dart';

@immutable
abstract class AlQuranEvent {}

class GetSurahByNumber extends AlQuranEvent {
  final int surahNum;

  GetSurahByNumber({required this.surahNum});
}