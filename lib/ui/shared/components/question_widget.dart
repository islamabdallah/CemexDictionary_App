import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../modules/question_details/question_details_screen.dart';
import '../models/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;

  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const QuestionDetails()));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
        child: Row(
          children: [
            Expanded(
                child: Text(
              question.questionTitle,
              style: const TextStyle(fontSize: 14),
            )),
            const Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }
}
