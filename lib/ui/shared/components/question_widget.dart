import 'package:faq_cemex/ui/shared/constants.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 28.h,horizontal: 16),
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
        ),
      ),
    );
  }
}
