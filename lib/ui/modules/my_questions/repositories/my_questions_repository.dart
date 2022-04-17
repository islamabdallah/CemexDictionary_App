import 'package:dio/dio.dart';

import '../../../../core/constants/api_path.dart';
import '../../../../core/utils/services/remote/dio_helper.dart';

abstract class MyQuestionsRepository {
  Future<Response> getMyQuestions();
}

class MyQuestionsRepositoryImplementation extends MyQuestionsRepository {
  @override
  getMyQuestions() async {
    Response getMyQuestionsResponse = await DioService.request(
      method: HttpMethod.POST,
      //todo change url
      url: loginUrl,
      data: {
        //todo add data
      },
    );

    return getMyQuestionsResponse;
  }
}
