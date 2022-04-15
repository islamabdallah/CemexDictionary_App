class Question {
  int id;
  String questionTitle;
  String? questionDescription;
  String? questionAnswer;
  List<String>? questionImagesUrls;
  List<String>? questionAnswerImagesUrls;
  List<String>? questionAnswerVideosUrls;

  Question({
    required this.id,
    required this.questionTitle,
    this.questionDescription,
    this.questionAnswer,
    this.questionImagesUrls,
    this.questionAnswerImagesUrls,
    this.questionAnswerVideosUrls,
  });
}
