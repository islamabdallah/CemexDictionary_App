import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CarouselYoutube extends StatelessWidget {
  const CarouselYoutube({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=zLhdtjx8Fpg')!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    return Scaffold(
      body: Center(
        child:  YoutubePlayerBuilder(
        player: YoutubePlayer(
        controller: _controller,

    ),
    builder: (context, player) {
      return Column(
        children: [
          // some widgets
          player,
          //some other widgets
        ],
      );
    },
    ),

    // child: Column(
        //   children: [

        //     SizedBox(
        //       height: 20,
        //     ),
        //     CarouselSlider(
        //       options: CarouselOptions(
        //         height: 200,
        //         // aspectRatio: 16/9,
        //         viewportFraction: 0.8,
        //         initialPage: 0,
        //         // enableInfiniteScroll: true,
        //         reverse: false,
        //         autoPlay: false,
        //         autoPlayInterval: Duration(seconds: 3),
        //         autoPlayAnimationDuration: Duration(milliseconds: 800),
        //         autoPlayCurve: Curves.fastOutSlowIn,
        //         // enlargeCenterPage: true,
        //         scrollDirection: Axis.horizontal,
        //       ),
        //       items: [
        //         Container(color: Colors.red,width: 200,height: 200,),
        //         Container(color: Colors.green,width: 200,height: 200,),
        //       ]
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
