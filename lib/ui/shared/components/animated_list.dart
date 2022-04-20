import 'package:faq_cemex/ui/shared/components/question_widget.dart';
import 'package:faq_cemex/ui/shared/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggeredAnimatedList extends StatelessWidget {
  final List<Question> questions;

  const StaggeredAnimatedList({Key? key, required this.questions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 1000),
          child: SlideAnimation(
            horizontalOffset: 100.0,
            child: FadeInAnimation(
              // horizontalOffset: 50,
              // verticalOffset: 50.0,
              child: QuestionWidget(question: questions[index]),
            ),
          ),
        ),
        itemCount: questions.length,
      ),
    );
  }
}
