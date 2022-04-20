import 'package:faq_cemex/ui/modules/add_question/screens/add_question_screen.dart';
import 'package:faq_cemex/ui/shared/components/question_widget.dart';
import 'package:faq_cemex/ui/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/components/animated_list.dart';
import '../../../shared/components/drawer_widget.dart';
import '../../../shared/models/question.dart';

class MyQuestions extends StatefulWidget {
  static const routeName = 'MyQuestionsScreen';

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

    List<Question> answeredQuestions = [
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

    List<Question> rejectedQuestions = [
      Question(
        id: 0,
        questionTitle: 'Can it be too hot or too cold to place new concrete?',
      ),
      Question(
        id: 0,
        questionTitle: 'What is air-entrained concrete?',
      ),
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, AddQuestionScreen.routeName);
          },
          label: Text('Ask'),
          icon: Icon(Icons.add),
        ),
        drawer: const DrawerWidget(),
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              iconSize: 35.h,
              icon: SvgPicture.asset(
                'assets/images/menu.svg',
                // fit: BoxFit.cover,
                width: 35.h,
                height: 35.h,
              ),
            );
          }),
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
                color: backgroundColor),
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
            SingleChildScrollView(
                child: StaggeredAnimatedList(questions: pendingQuestions)),
            StaggeredAnimatedList(questions: answeredQuestions),
            StaggeredAnimatedList(questions: rejectedQuestions),
          ],
        ),
      ),
    );
  }
}
