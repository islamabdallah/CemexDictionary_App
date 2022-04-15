import 'package:faq_cemex/ui/shared/components/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../shared/components/animated_list.dart';
import '../../shared/models/question.dart';

class MyQuestions extends StatefulWidget {
  const MyQuestions({Key? key}) : super(key: key);

  @override
  _MyQuestionsState createState() => _MyQuestionsState();
}

class _MyQuestionsState extends State<MyQuestions> {
  @override
  Widget build(BuildContext context) {
    List<Question> pendingQuestions = [
      Question(
        id: 0,
        questionTitle: 'How ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'what ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'Is ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods of payment does Cemex accept?',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods of payment does Cemex accept?',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods of payment does Cemex accept?',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods of payment does Cemex accept?',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods of payment does Cemex accept?',
      ),    Question(
        id: 0,
        questionTitle: 'How ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'what ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'Is ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods  wdahwudaskdhun ansljdasnldn kaidjojioasd of payment does Cemex accept?',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods of payment does Cemex accept?',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods of payment does Cemex accept?',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods of payment does Cemex accept?',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods of payment does Cemex accept?',
      ),
    ];

    List<Question> answeredQuestions = [
      Question(
        id: 0,
        questionTitle: 'How ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'what ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'what ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'Is ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'What methods of payment does Cemex accept?',
      ),
    ];

    List<Question> rejectedQuestions = [
      Question(
        id: 0,
        questionTitle: 'How ...........',
      ),
      Question(
        id: 0,
        questionTitle: 'what ...........',
      ),
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 40,
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text('My Questions'),
          bottom: TabBar(
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.white,
            // indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white),
            tabs: [
              Tab(
                child: Text(
                    '${pendingQuestions.isNotEmpty ? '(${pendingQuestions.length})' : ''} Pending'),
              ),
              Tab(
                child: Text(
                    '${pendingQuestions.isNotEmpty ? '(${answeredQuestions.length})' : ''} Answered'),
              ),
              Tab(
                child: Text(
                    '${pendingQuestions.isNotEmpty ? '(${rejectedQuestions.length})' : ''} Rejected'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(child: StaggeredAnimatedList(questions: pendingQuestions)),
            StaggeredAnimatedList(questions: answeredQuestions),
            StaggeredAnimatedList(questions: rejectedQuestions),
          ],
        ),
      ),
    );
  }
}
