part of 'add_question_cubit.dart';

@immutable
abstract class AddQuestionState {}

class AddQuestionInitial extends AddQuestionState {}

class ImageAddedSuccessState extends AddQuestionState {}
class ImageRemovedSuccessState extends AddQuestionState {}
