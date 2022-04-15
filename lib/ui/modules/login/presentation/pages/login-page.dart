import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class LoginWidget extends StatefulWidget {
  static const routeName = 'LoginWidget';

  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  // LoginBloc _bloc;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // _bloc = LoginBloc(BaseLoginState());
    super.initState();
  }

// validate Email
  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value != null) {
      print(regex.hasMatch(value));

      if (!regex.hasMatch(value)) {
        return 'emailError';
      } else {
        return null;
      }
    }
    return null;
  }

//   validate Password
//   String? validatePassword(String? value) {
//     if (value!=null ) {
//       value.isEmpty?return
//        'passwordError'
//     } else {
//       return null;
//     }
//   }

  String? validatePassword(String? value) {
    if (value != null) {
      if (value.isEmpty) return 'passwordError';
      return null;
    }
    return null;
  }

  @override
  void dispose() {
    // _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/cemex.jpg')),
              ),
            ),
            Builder(
                // cubit: _bloc,
                builder: (
              context,
            ) {
//                  if (state is LoginFailedState) {
//                    if (_clicked) {
//                      _clicked = false;
//                      Navigator.pop(context);
//                    }
//
//                  }

                  return Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'email',
                              hintText: 'emailHint',
                              labelStyle: TextStyle(
                                // fontFamily: FONT_FAMILY,
                                  fontWeight: FontWeight.w600)),
                          style: TextStyle(
                            // fontFamily: FONT_FAMILY,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: validateEmail,
                          onChanged: (String val) {
                            // this.user?.email = emailController.text.toString();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'password',
                              hintText: 'passwordHint',
                              labelStyle: TextStyle(
                                // fontFamily: FONT_FAMILY,
                                  fontWeight: FontWeight.w600)),
                          style: TextStyle(
                            // fontFamily: FONT_FAMILY,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: passwordController,
                          validator: validatePassword,
                          onChanged: (String val) {
                            // this.user?.password =
                            //     passwordController.text.toString();
                          },
                        ),
                      ),
                      // if (state is LoginFailedState)
                      //   Padding(
                      //       padding: const EdgeInsets.only(
                      //           left: 15.0, right: 15.0, top: 5, bottom: 5),
                      //       child: Align(
                      //         child: Text(
                      //           state.error.message,
                      //           style: TextStyle(
                      //               color: Colors.red,
                      //               fontFamily: FONT_FAMILY,
                      //               fontWeight: FontWeight.w600),
                      //         ),
                      //         alignment: Alignment.centerRight,
                      //       )),
//                          Padding(
//                          padding: const EdgeInsets.only(left: 3.0, right: 3.0, top: 5, bottom: 5),
//                              child:Align(
//                                child:FlatButton(
//                                  onPressed: () {
//                              //TODO FORGOT PASSWORD SCREEN GOES HERE
//
//                                    Navigator.pushNamed(context, ForgotPasswordWidget.routeName);
//
//                                  },
//                            child: Text(translator.translate('forgotPassword'),
//                              style: TextStyle(color: Colors.blue, fontFamily: FONT_FAMILY,fontWeight: FontWeight.w600),
//                            ),
//                          ),
//                            alignment: (translator.currentLanguage == 'en' )? Alignment.centerLeft : Alignment.centerRight,
//                          )),
                      Container(
                        margin: EdgeInsets.only(top: 45),
                        height: 50,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 30.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            // if (!_formKey.currentState.validate()) {
                            //   return;
                            // }
                            // if (_formKey.currentState.validate()) {
                            //   _bloc.add(LoginEvent(userModel: this.user));
                            // }
                          },
                          child: Text(
                            translator.translate('login'),
                            style: TextStyle(
                                color: Colors.white,
                                // fontFamily: FONT_FAMILY,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ]),
                  );
                },),
            // }, listener: (context, state) {
            //   if (state is LoginSuccessState) {
            //     Navigator.pop(context);
            //     Navigator.pop(context);
            //     Navigator.of(context).pushNamedAndRemoveUntil(
            //         HomeWidget.routeName, (Route<dynamic> route) => false);
            //   }
            //   if (state is LoginFailedState) Navigator.pop(context);
            //   if (state is LoginLoadingState) loadingAlertDialog(context);
            // }),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 3.0, right: 3.0, top: 3, bottom: 3),
                child: Align(
                  child: FlatButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, SignUpWidget.routeName);
                    },
                    child: Text(
                      translator.translate('newUser'),
                      style: TextStyle(
                        // fontFamily: FONT_FAMILY,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                )),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    child: Text(
                      translator.translate('english'),
                      style: TextStyle(
                          color: (translator.currentLanguage == 'en')
                              ? Colors.grey
                              : Colors.blue,
                          // fontFamily: FONT_FAMILY,
                          fontWeight: FontWeight.w600),
                    ),
                    color: Colors.transparent,
                    textColor: Colors.black,
                    onPressed: () {
                      translator.setNewLanguage(
                        context,
                        newLanguage: 'en',
                        remember: true,
                        restart: true,
                      );
                    },
                  ),
                  SizedBox(
                    width: 20,
                    child: Text(
                      '|',
                      style: TextStyle(
                          color: (translator.currentLanguage != 'en')
                              ? Colors.grey
                              : Colors.blue,
                          // fontFamily: FONT_FAMILY,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      translator.translate('arabic'),
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.transparent,
                    textColor: Colors.black,
                    onPressed: () {
                      translator.setNewLanguage(
                        context,
                        newLanguage: 'ar',
                        remember: true,
                        restart: true,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
