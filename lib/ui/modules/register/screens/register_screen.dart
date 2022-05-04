import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../shared/components/drop_down_full_tap.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils/loading_dialog.dart';
import '../../../shared/utils/message_dialog.dart';
import '../../login/screens/login_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = 'RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/login.jpg"), context);

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            loadingAlertDialog(context);
          }

          if (state is RegisterErrorState) {
            Navigator.pop(context);
            showMessageDialog(
                context: context,
                message: state.message,
                isSucceeded: false,
                onPressedRetry: () {
                  print('ha');
                });
          }

          if (state is RegisterSuccessState) {
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
          var cubit = RegisterCubit.get(context);
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
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 36.sp, color: mainColor),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome to Our App',
                          style: TextStyle(
                              fontSize: 18.sp, color: Colors.grey[700]),
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
                                label: Text('Name'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainColor),
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 26,
                                  color: mainColor,
                                ),
                                // filled: true,
                                // fillColor: Color(0xFFF5F5F5),
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
                                // filled: true,
                                // fillColor: Color(0xFFF5F5F5),
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
                            DropdownButtonFormField<String>(
                              iconSize: 0,
                              decoration: InputDecoration(
                                label: Text('State'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainColor),
                                prefixIcon: Icon(
                                  Icons.location_city,
                                  size: 26,
                                  color: mainColor,
                                ),
                                // filled: true,
                                // fillColor: Color(0xFFF5F5F5),
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 24,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: mainColor),
                                ),
                              ),
                              onChanged: (value) {},
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'Assiut',
                                  child: Text('Assiut'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Minya',
                                  child: Text('Minya'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Sohag',
                                  child: Text('Sohag'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            DropdownButtonFormField<String>(
                              iconSize: 0,
                              decoration: InputDecoration(
                                label: Text('Zone'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainColor),
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  size: 26,
                                  color: mainColor,
                                ),
                                // filled: true,
                                // fillColor: Color(0xFFF5F5F5),
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 24,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: mainColor),
                                ),
                              ),
                              onChanged: (value) {},
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'Ghanayem',
                                  child: Text('Ghanayem'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Abu Tig',
                                  child: Text('Abu Tig'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Manfalut',
                                  child: Text('Manfalut'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),

                            DropdownSearch<String>(
                              mode: Mode.MENU,
                              showSelectedItems: true,
                              items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                              dropdownSearchDecoration: InputDecoration(
                                label: Text('Zone'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainColor),
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  size: 26,
                                  color: mainColor,
                                ),
                                // filled: true,
                                // fillColor: Color(0xFFF5F5F5),
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 24,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: mainColor),
                                ),
                              ),
                              onChanged: print,
                              selectedItem: "Brazil",
                            ),

                            SizedBox(
                              height: 16.h,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                label: const Text('Address'),
                                labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mainColor),
                                prefixIcon: Icon(
                                  Icons.home,
                                  size: 26,
                                  color: mainColor,
                                ),
                                // filled: true,
                                // fillColor: Color(0xFFF5F5F5),
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
                                label: Text('Password'),
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
                                      RegisterCubit.get(context)
                                          .changeTextVisibility(
                                              !RegisterCubit.get(context)
                                                  .isTextVisible);
                                    },
                                    icon:
                                        RegisterCubit.get(context).isTextVisible
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
                                // filled: true,
                                // fillColor: Color(0xFFF5F5F5),
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
                        height: 20.h,
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
                            'Register'.tr(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text('Already have account?'),
                          SizedBox(
                            width: 4,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(50, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerLeft),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.routeName);
                            },
                            child: Text(
                              'Login',
                            ),
                          )
                        ],
                      )
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
