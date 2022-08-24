import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/core/utils/sp_helper/cache_helper.dart';
import 'package:la_vie/model/quiz.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial()) {
    quiz = Quiz();
    questionNum = 0;
    points = 0;
    questions = quiz!.quiz!.keys.toList();
    color = Colors.white;
  }
  static QuizCubit get(context) => BlocProvider.of(context);
  Quiz? quiz;
  late Color color;
  List<String>? questions;
  int? questionNum;
  int? points;

  void getNext() {
    if (questionNum! < 9) {
      questionNum = questionNum! + 1;
      emit(GotNextState());
    }
  }

  void getprevious() {
    if (questionNum! > 0) {
      questionNum = questionNum! - 1;
      emit(GotPreviousState());
    }
  }

  String? getCurrentQuestion() {
    return questions![questionNum!];
  }

  void updatePoints(int point) {
    points = points! + point;
  }

  static void saveQuizStartDate() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);
    SharedPreferencesHelper.saveData(
        key: "${SharedPreferencesHelper.getData(key: "accessToken")}",
        value: date.toString());
  }

  static bool isWeekPassed() {
    DateTime date1 = DateTime.parse(SharedPreferencesHelper.getData(
        key: "${SharedPreferencesHelper.getData(key: "accessToken")}"));
    DateTime now = DateTime.now();
    DateTime date2 = DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);

    print("date1 ${date1.toString()}");
    print("date2 ${date2.toString()}");
    if (date1.year < date2.year) {
      return true;
    } else if (date1.year > date2.year) {
      return false;
    }
    if (date1.month < date2.month) {
      return true;
    } else if (date1.month > date2.month) {
      return false;
    }
    if (date1.day < date2.day && date2.day - date1.day > 7) {
      return true;
    } else {
      return false;
    }
  }

  List<Map<String, int>>? getCurrentAnswers() {
    return quiz!.getPossibleAnswers(questions![questionNum!]);
  }
}
