import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../shared/constants.dart';
import '../../../shared/utils/loading_dialog.dart';
import '../../../shared/utils/message_dialog.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/login.jpg"), context);

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            loadingAlertDialog(context);
          }

          if (state is LoginErrorState) {
            Navigator.pop(context);
            showMessageDialog(
                context: context,
                message: state.message,
                isSucceeded: false,
                onPressedRetry: () {
                  print('ha');
                });
          }

          if (state is LoginSuccessState) {
            Navigator.pop(context);
            // TruckCubit.get(context).setTrucks(state.trucks);
            // Navigator.pushReplacementNamed(context, TruckSelectionScreen.routeName);
            // navigateAndFinish(
            //   context: context,
            //   nextScreen: TruckSelectionScreen.routeName,
            // );
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            // backgroundColor: backgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                        child: Image.asset(
                          'assets/images/login.jpg',
                          width: 300.w,
                          height: 300.h,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 36.sp,color: mainColor),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome back to Out App',
                          style: TextStyle(fontSize: 18.sp,color: Colors.grey[700]),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                label: Text('Email'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainColor),
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 26,
                                  color: mainColor,
                                ),
                                filled: true,
                                fillColor: Color(0xFFF5F5F5),
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: mainColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextFormField(
                              obscureText: !cubit.isTextVisible,
                              decoration: InputDecoration(
                                label: Text('PassWord'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainColor),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 26,
                                  color: mainColor,
                                ),
                                suffixIcon: Material(
                                  color: Colors.transparent,
                                  child: IconButton(
                                    highlightColor: Colors.transparent,
                                    splashRadius: 30.r,
                                    splashColor: mainColor.withOpacity(0.6),
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      LoginCubit.get(context)
                                          .changeTextVisibility(
                                              !LoginCubit.get(context)
                                                  .isTextVisible);
                                    },
                                    icon:
                                        LoginCubit.get(context).isTextVisible
                                            ? Icon(
                                                Icons.visibility_off_outlined,
                                                color: mainColor,
                                                size: 30.r,
                                              )
                                            : Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: mainColor,
                                                size: 30.r,
                                              ),
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF5F5F5),
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: mainColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      SizedBox(
                        width: 120.w,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            side: BorderSide(color: mainColor, width: 1.2),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r))),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.login();
                            }
                          },
                          child: Text(
                            'Login'.tr(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
