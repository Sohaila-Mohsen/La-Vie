import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc/quizCubit/quiz_cubit.dart';
import 'package:la_vie/bloc/selectedIndexCubit/selected_index_cubit.dart';
import 'package:la_vie/core/components/quiz_item.dart';
import 'package:la_vie/core/style/app_colors/app_colors.dart';
import 'package:la_vie/views/home_screen.dart';

import '../core/style/app_text_style/app_text_style.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double constraintsHeight = MediaQuery.of(context).size.height;
    double constraintsWidht = MediaQuery.of(context).size.width;
    QuizCubit quizCubit = QuizCubit.get(context);
    SelectedIndexCubit selected = SelectedIndexCubit.get(context);
    selected.changeIndex(-1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Course Exam",
          style: AppTextStyle.defultTextStyle(14),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocConsumer<QuizCubit, QuizState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Question ",
                      style: AppTextStyle.defultTextStyle(20),
                    ),
                    Text(
                      "${quizCubit.questionNum! + 1}",
                      style: AppTextStyle.defultTextStyle(20,
                          color: AppColors.primaryColorLight),
                    ),
                    Text(
                      "/10",
                      style: AppTextStyle.grayTextStyle(11),
                    ),
                  ],
                ),
                Text(
                  quizCubit.getCurrentQuestion()!,
                  style: AppTextStyle.defultTextStyle(14),
                ),
                BlocConsumer<SelectedIndexCubit, SelectedIndexState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return SizedBox(
                      height: constraintsHeight - 270,
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              selected.changeIndex(index);
                              quizCubit.updatePoints(
                                  quizCubit.getCurrentAnswers()![index][
                                      quizCubit
                                          .getCurrentAnswers()![index]
                                          .keys
                                          .toList()[0]]!);
                            },
                            child: QuizItem(
                                isSelected: (selected.selectedIndex == index),
                                Choice:
                                    "${quizCubit.getCurrentAnswers()![index].keys.toList()[0]}"),
                          );
                        },
                      ),
                    );
                  },
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      (quizCubit.questionNum! >= 1)
                          ? Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraintsWidht / 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryColorLight),
                                  borderRadius: BorderRadius.circular(8)),
                              child: TextButton(
                                onPressed: () {
                                  selected.changeIndex(-1);
                                  quizCubit.getprevious();
                                },
                                child: Text(
                                  "Back",
                                  style: AppTextStyle.defultTextStyle(11,
                                      color: AppColors.primaryColorLight),
                                ),
                              ),
                            )
                          : Container(
                              height: 35,
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraintsWidht / 8 + 10),
                            ),
                      Container(
                        height: 35,
                        padding: EdgeInsets.symmetric(
                            horizontal: constraintsWidht / 8),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: TextButton(
                          onPressed: () {
                            selected.changeIndex(-1);
                            quizCubit.getNext();
                            if (quizCubit.questionNum! == 9) {
                              selected.changeIndex(2);
                              QuizCubit.saveQuizStartDate();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                  (route) => false);
                            }
                            print("points = ${quizCubit.points}");
                          },
                          child: (quizCubit.questionNum! == 9)
                              ? Text(
                                  "Finish",
                                  style: AppTextStyle.defultTextStyle(11,
                                      color: Colors.white),
                                )
                              : Text(
                                  "Next",
                                  style: AppTextStyle.defultTextStyle(11,
                                      color: Colors.white),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
