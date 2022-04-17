import 'package:flutter/material.dart';

import '../../../ui/modules/add_question/screens/add_question_screen.dart';
import '../../../ui/modules/login/screens/login_screen.dart';
import '../../../ui/modules/my_questions/screens/my_questions_screen.dart';
import '../../../ui/modules/notification/screens/notification_screen.dart';
import '../../../ui/modules/search_screen/screens/search_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return _materialRoute(const LoginScreen(), LoginScreen.routeName);
      case SearchScreen.routeName:
        return _materialRoute(const SearchScreen(), SearchScreen.routeName);
      case MyQuestions.routeName:
        return _materialRoute(const MyQuestions(), MyQuestions.routeName);
      case AddQuestionScreen.routeName:
        return _materialRoute(
            const AddQuestionScreen(), AddQuestionScreen.routeName);
        case NotificationScreen.routeName:
        return _materialRoute(
            const NotificationScreen(), NotificationScreen.routeName);
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _materialRoute(
            const Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text('Route Error'),
                ),
              ),
            ),
            '404');
    }
  }

  static Route<dynamic> _materialRoute(Widget view, String routeName) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => view,
    );
  }
}
