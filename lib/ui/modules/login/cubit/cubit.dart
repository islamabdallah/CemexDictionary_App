import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:faq_cemex/ui/modules/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/login_repository.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginRepositoryImplementation repo = LoginRepositoryImplementation();
  TextEditingController userNameController = TextEditingController(
    // text: CacheHelper.getData(key: 'userName') ?? '',
  );
  TextEditingController passwordController = TextEditingController(
    // text: CacheHelper.getData(key: 'password') ?? '',
  );

  bool isTextVisible = false;
  int notificationsCount = 0;

// hide or visible password text
  void changeTextVisibility(bool value) {
    isTextVisible = value;
    emit(ChangePasswordVisibilityState());
  }

  void login() async {
    emit(LoginLoadingState());
    try {
      var result = await repo.loginUser(
        username: userNameController.text,
        pass: passwordController.text,
      );
      if (result != null) {
        print(result);
        if (result.data['flag']) {
          print(result.data['flag']);
          print(result.data);
          emit(LoginSuccessState(result.data['trucks']));
        } else {
          emit(LoginErrorState('Something went wrong!'));
        }
      } else {
        emit(LoginErrorState('Something went wrong!'));
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response?.data['message']);
        emit(LoginErrorState(error.response?.data['message']));
      } else {
        print(error);
        print(error.type);
        // print(error);
        emit(LoginErrorState(
            'server error, check your internet connection and try again.'));
      }
    } catch (error) {
      print(error);
      emit(LoginErrorState('Something wrong!'));
    }
  }
}
