import 'package:carousel_slider/carousel_slider.dart';
import 'package:faq_cemex/ui/modules/question_details/gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_viewer/image_viewer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class QuestionDetails extends StatefulWidget {
  const QuestionDetails({Key? key}) : super(key: key);

  @override
  State<QuestionDetails> createState() => _QuestionDetailsState();
}

class _QuestionDetailsState extends State<QuestionDetails> {
  var questionActiveImageIndex = 0;
  var answerActiveImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> urlImages = [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Energetically_Modified_Cement_%28EMC%29_Lule%C3%A5_Sweden_08_2020.jpg/1200px-Energetically_Modified_Cement_%28EMC%29_Lule%C3%A5_Sweden_08_2020.jpg',
      'https://www.globmac.com/wp-content/uploads/2021/08/difference-between-concrete-and-cement-01.jpg',
      'https://cdn.shopify.com/s/files/1/0789/0805/articles/cement_vs_concrete_800x.png?v=1510110035',
    ];

    final List<String> urlImagesAns = [
      'https://www.civilclick.com/wp-content/uploads/2020/04/Difference-between-concrete-and-cement-comparison.png',
      'https://www.familyhandyman.com/wp-content/uploads/2018/12/concrete-recipe.jpg',
      'https://scmaonline.org/wp-content/uploads/2019/06/cement-concrete.jpg',
    ];

    var controller = CarouselController();

    void openGallery({int index = 0}) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => GalleryScreen(
                urlImages: urlImages,
                index: index,
              )));
    }

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // openGallery();
      //     // ImageViewer.showImageSlider(
      //     //   images: [
      //     //     'https://cdn.eso.org/images/thumb300y/eso1907a.jpg',
      //     //     'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
      //     //     'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
      //     //   ],
      //     //   startingPosition: 1,
      //     // );
      //     //
      //     translator.setNewLanguage(context,
      //         newLanguage: 'ar', remember: true, restart: false);
      //   },
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 25,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                ),
                iconSize: 30,
              ),
              Text(
                'Answered'.tr(),
                style: const TextStyle(
                  color: Color(0xFF14AB0E),
                  fontFamily: 'Vazirmatn',
                  fontSize: 14,
                ),
              ),
              Text(
                'questionTest'.tr(),
                style: TextStyle(
                  color: Color(0xFF24272C),
                  fontFamily: 'Vazirmatn',
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'questionDescription'.tr(),
                style: TextStyle(
                  color: Color(0xFF24272C),
                  fontFamily: 'Vazirmatn',
                  fontSize: 16,
                ),
              ),

              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  horizontalTitleGap: 10.0,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    textColor: Color(0xFF7D7D7D),
                    iconColor: Color(0xFF7D7D7D),
                    collapsedTextColor: Color(0xFF7D7D7D),
                    collapsedIconColor: Color(0xFF7D7D7D),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    title: Text('Images'.tr()),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      CarouselSlider(
                          options: CarouselOptions(
                              height: 150,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, _) {
                                setState(() {
                                  questionActiveImageIndex = index;
                                });
                              }),
                          items: [
                            Hero(
                              tag: 0,
                              child: GestureDetector(
                                onTap: () {
                                  openGallery(index: 0);
                                },
                                child: Image.network(
                                  urlImages[0],
                                  height: 80.0,
                                  width: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Hero(
                              tag: 1,
                              child: GestureDetector(
                                onTap: () {
                                  openGallery(index: 1);
                                },
                                child: Image.network(
                                  urlImages[1],
                                  height: 80.0,
                                  width: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Hero(
                              tag: 2,
                              child: GestureDetector(
                                onTap: () {
                                  openGallery(index: 2);
                                },
                                child: Image.network(
                                  urlImages[2],
                                  height: 80.0,
                                  width: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 16,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: questionActiveImageIndex,
                        count: urlImages.length,
                        effect: WormEffect(
                          activeDotColor: Colors.red,
                          dotHeight: 10,
                          dotWidth: 10,
                        ), // your preferred effect
                      ),
                    ],
                  ),
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  horizontalTitleGap: 10.0,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    textColor: Color(0xFF7D7D7D),
                    iconColor: Color(0xFF7D7D7D),
                    collapsedTextColor: Color(0xFF7D7D7D),
                    collapsedIconColor: Color(0xFF7D7D7D),
                    tilePadding: EdgeInsets.zero,
                    title: Text('Video'.tr()),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[],
                  ),
                ),
              ),

              //Answer
              Text(
                'Answer'.tr(),
                style: TextStyle(
                  color: Color(0xFF24272C),
                  fontFamily: 'Vazirmatn',
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'questionDescription'.tr(),
                style: TextStyle(
                  color: Color(0xFF24272C),
                  fontFamily: 'Vazirmatn',
                  fontSize: 16,
                ),
              ),

              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  horizontalTitleGap: 10.0,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    textColor: Color(0xFF7D7D7D),
                    iconColor: Color(0xFF7D7D7D),
                    collapsedTextColor: Color(0xFF7D7D7D),
                    collapsedIconColor: Color(0xFF7D7D7D),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    title: Text('Images'.tr()),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      CarouselSlider(
                          options: CarouselOptions(
                              height: 150,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: false,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, _) {
                                setState(() {
                                  answerActiveImageIndex = index;
                                });
                              }),
                          items: [
                            Hero(
                              tag: 0,
                              child: GestureDetector(
                                onTap: () {
                                  openGallery(index: 0);
                                },
                                child: Image.network(
                                  urlImagesAns[0],
                                  height: 80.0,
                                  width: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Hero(
                              tag: 1,
                              child: GestureDetector(
                                onTap: () {
                                  openGallery(index: 1);
                                },
                                child: Image.network(
                                  urlImagesAns[1],
                                  height: 80.0,
                                  width: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Hero(
                              tag: 2,
                              child: GestureDetector(
                                onTap: () {
                                  openGallery(index: 2);
                                },
                                child: Image.network(
                                  urlImagesAns[2],
                                  height: 80.0,
                                  width: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 16,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: answerActiveImageIndex,
                        count: urlImages.length,
                        effect: WormEffect(
                          activeDotColor: Colors.red,
                          dotHeight: 10,
                          dotWidth: 10,
                        ), // your preferred effect
                      ),
                    ],
                  ),
                ),
              ),
              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  horizontalTitleGap: 10.0,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    textColor: Color(0xFF7D7D7D),
                    iconColor: Color(0xFF7D7D7D),
                    collapsedTextColor: Color(0xFF7D7D7D),
                    collapsedIconColor: Color(0xFF7D7D7D),
                    tilePadding: EdgeInsets.zero,
                    title: Text('Video'.tr()),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId:
                              YoutubePlayer.convertUrlToId('https://youtu.be/fYPXzaxG7Mo')!,
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                              ),
                            ),
                          ),
                          builder: (context, player) {
                            return Column(
                              children: [
                                // some widgets
                                player,
                                //some other widgets
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
