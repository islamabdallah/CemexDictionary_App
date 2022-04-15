import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_question_state.dart';

class AddQuestionCubit extends Cubit<AddQuestionState> {
  static AddQuestionCubit get(context) => BlocProvider.of(context);

  AddQuestionCubit() : super(AddQuestionInitial());

  List<File> images = [];

  pickImages() async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? images = await _picker.pickMultiImage(
      maxHeight: 200,
      maxWidth: 200,
    );
    if (images != null) {
      for (var image in images) {
        this.images.add(File(image.path));
      }
      emit(ImageAddedSuccessState());
    }
  }

  removeImage(index){
    images.removeAt(index);
    emit(ImageRemovedSuccessState());

  }

}
