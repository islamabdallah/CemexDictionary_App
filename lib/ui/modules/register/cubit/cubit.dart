import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:faq_cemex/ui/modules/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/register_repository.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);
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
    emit(RegisterLoadingState());
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
          emit(RegisterSuccessState(result.data['trucks']));
        } else {
          emit(RegisterErrorState('Something went wrong!'));
        }
      } else {
        emit(RegisterErrorState('Something went wrong!'));
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print(error.response?.data['message']);
        emit(RegisterErrorState(error.response?.data['message']));
      } else {
        print(error);
        print(error.type);
        // print(error);
        emit(RegisterErrorState(
            'server error, check your internet connection and try again.'));
      }
    } catch (error) {
      print(error);
      emit(RegisterErrorState('Something wrong!'));
    }
  }
}
