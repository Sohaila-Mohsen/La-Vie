part of 'quiz_cubit.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class GotNextState extends QuizState {}

class GotPreviousState extends QuizState {}
