import 'package:dio/dio.dart';

import '../../../../core/constants/api_path.dart';
import '../../../../core/utils/services/remote/dio_helper.dart';

abstract class AddQuestionRepository {
  Future<Response> addQuestion();
}

class AddQuestionRepositoryImplementation extends AddQuestionRepository {
  @override
  addQuestion() async {
    Response addQuestionResponse = await DioService.request(
      method: HttpMethod.POST,
      //todo change url
      url: loginUrl,
      data: {
        //todo add data
      },
    );

    return addQuestionResponse;
  }
}
