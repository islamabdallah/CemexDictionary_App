import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_question_state.dart';

class MyQuestionCubit extends Cubit<MyQuestionState> {
  MyQuestionCubit() : super(MyQuestionInitial());
}
