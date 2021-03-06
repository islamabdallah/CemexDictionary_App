import 'package:badges/badges.dart';
import 'package:faq_cemex/ui/modules/my_questions/screens/my_questions_screen.dart';
import 'package:faq_cemex/ui/modules/notification/screens/notification_screen.dart';
import 'package:faq_cemex/ui/modules/search_screen/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../modules/login/screens/login_screen.dart';
import '../constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
        color: const Color(0xff293064),
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: 20.0.sp);
    return SizedBox(
      width: 273.w,
      child: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 25.h),
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 35.h,
                  width: 35.h,
                  padding: EdgeInsets.zero,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/close.svg',
                      height: 30.h,
                      width: 30.h,
                      color: mainColor,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Tire@cemex.com',
                  style: TextStyle(
                      color: const Color(0xff293064),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontSize: 22.0.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: const Divider(
                  thickness: 1,
                  color: mainColor,
                ),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                leading: Icon(Icons.search),
                title: Text(
                  "Search",
                  style: style,
                ),
                onTap: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(SearchScreen.routeName));
                },
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                leading: Icon(Icons.question_answer),
                title: Text(
                  "My Questions",
                  style: style,
                ),
                onTap: () {
                  if (ModalRoute.of(context)?.settings.name ==
                      SearchScreen.routeName) {
                    Navigator.pushNamed(context, MyQuestions.routeName);
                    print('hhhhh');
                  } else {
                    Navigator.pushReplacementNamed(
                        context, MyQuestions.routeName);
                    print('nnnnnn');
                  }
                  // Navigator.pushNamedAndRemoveUntil(context, MyQuestions.routeName, ModalRoute.withName(SearchScreen.routeName));
                },
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                leading: Badge(
                    position: BadgePosition(top: -7, end: -6),
                    badgeColor: Colors.orange,
                    badgeContent: Text('5', style: TextStyle(fontSize: 12)),
                    child: Icon(Icons.notifications)),
                title: Text(
                  "Notifications",
                  style: style,
                ),
                onTap: () {
                  if (ModalRoute.of(context)?.settings.name ==
                      SearchScreen.routeName) {
                    Navigator.pushNamed(context, NotificationScreen.routeName);
                    print('hhhhh');
                  } else {
                    Navigator.pushReplacementNamed(
                        context, NotificationScreen.routeName);
                    print('nnnnnn');
                  }
                },
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: style,
                ),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName, (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
