import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryScreen extends StatefulWidget {
  final List<String> urlImages;
  final int index;

  const GalleryScreen({Key? key, required this.urlImages, this.index = 0})
      :
        super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late int index;
  late final PageController pageController;

  @override
  void initState() {
    index = widget.index;
    pageController = PageController(initialPage: index);
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PhotoViewGallery.builder(
            pageController: pageController,
            itemCount: widget.urlImages.length,
            builder: (context, index) {
              final urlImage = widget.urlImages[index];
              return PhotoViewGalleryPageOptions(
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 4.1,
                  heroAttributes: PhotoViewHeroAttributes(tag: index),
                  imageProvider: NetworkImage(urlImage));
            },
            onPageChanged: (index) => setState(() => this.index = index),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            child: Text(
              '${index + 1}/${widget.urlImages.length}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
