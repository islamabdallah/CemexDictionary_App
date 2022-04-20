import 'package:faq_cemex/ui/modules/add_question/screens/add_question_screen.dart';
import 'package:faq_cemex/ui/modules/login/screens/login_screen.dart';
import 'package:faq_cemex/ui/modules/notification/screens/notification_screen.dart';
import 'package:faq_cemex/ui/modules/register/screens/register_screen.dart';
import 'package:faq_cemex/ui/modules/search_screen/cubit/search_cubit.dart';
import 'package:faq_cemex/ui/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'carousel_youtube_player_screen.dart';
import 'core/config/routes/routes.dart';
import 'core/utils/services/bloc_observer.dart';
import 'core/utils/services/local/cache_helper.dart';
import 'home_screen.dart';
import 'ui/modules/my_questions/screens/my_questions_screen.dart';
import 'ui/modules/question_details/question_details_screen.dart';
import 'ui/modules/search_screen/screens/search_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  FlutterAppBadger.updateBadgeCount(1);

}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await CacheHelper.init();

  await translator.init(
    language: 'en',
    localeType: LocalizationDefaultType.asDefined,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
  );

  await CacheHelper.init();

  BlocOverrides.runZoned(
    () {
      runApp(
        LocalizedApp(
          child: MyApp(),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFCA3A3A), //or set color with: Color(0xFF0000FF)
    ));

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: () {
          return MultiBlocProvider(
            providers: [
              BlocProvider<SearchCubit>(
                create: (context) => SearchCubit(),
              )
            ],
            child: MaterialApp(
              color: mainColor,

              localizationsDelegates: translator.delegates,
              // Android + iOS Delegates
              locale: translator.activeLocale,
              // Active locale
              supportedLocales: translator.locals(),
              // Locals list
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: backgroundColor,
                primaryColor: mainColor,
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: mainColor,
                ),
                floatingActionButtonTheme:FloatingActionButtonThemeData(
                  backgroundColor: mainColor
                )
              ),
              onGenerateRoute: AppRoutes.onGenerateRoutes,
              initialRoute: LoginScreen.routeName,
              // initialRoute: RegisterScreen.routeName,
              // initialRoute: AddQuestionScreen.routeName,
              // initialRoute: SearchScreen.routeName,
              // initialRoute: NotificationScreen.routeName,
              builder: (context, widget) {
                ScreenUtil.setContext(context);
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              // home: MyHomePage(title: 'appTitle'.tr()),
              // home: HomeScreen(),
              // home: SearchScreen(),
              // home: QuestionDetails(),
              // home: CarouselYoutube(),
              // home: AddQuestionScreen(),
              // home: MyQuestions(),
              // home: LoginWidget(),
            ),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    translator.setNewLanguage(context,
        newLanguage: translator.activeLanguageCode == 'en' ? 'ar' : 'en');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
