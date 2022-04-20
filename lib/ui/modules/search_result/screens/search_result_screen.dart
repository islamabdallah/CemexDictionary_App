import 'package:faq_cemex/ui/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/animated_list.dart';
import '../../../shared/models/question.dart';

class SearchResultScreen extends StatelessWidget {
  static const routeName = 'SearchResultScreen';

  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Question> pendingQuestions = [
      Question(
        id: 0,
        questionTitle: 'What is the difference between cement and concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'How is Portland cement made?',
      ),
      Question(
        id: 0,
        questionTitle: 'What does it mean to "cure" concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'Can it be too hot or too cold to place new concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'What is air-entrained concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'What is the difference between cement and concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'How is Portland cement made?',
      ),
      Question(
        id: 0,
        questionTitle: 'What does it mean to "cure" concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'Can it be too hot or too cold to place new concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'What is air-entrained concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'What is the difference between cement and concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'How is Portland cement made?',
      ),
      Question(
        id: 0,
        questionTitle: 'What does it mean to "cure" concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'Can it be too hot or too cold to place new concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'What is air-entrained concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'What is the difference between cement and concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'How is Portland cement made?',
      ),
      Question(
        id: 0,
        questionTitle: 'What does it mean to "cure" concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'Can it be too hot or too cold to place new concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'What is air-entrained concrete?',
      ),
    ];
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text('Search Results'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8,),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Text('Results',style: TextStyle(fontSize: 22),),
          // ),
          Expanded(
              child: SingleChildScrollView(
                  child: StaggeredAnimatedList(questions: pendingQuestions))),
        ],
      ),
    );
  }
}
