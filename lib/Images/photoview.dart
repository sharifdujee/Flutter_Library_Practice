import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


class PhotoViews extends StatefulWidget {
  const PhotoViews({super.key});

  @override
  State<PhotoViews> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoViews> {
  final List<GalleryItem> galleryItems = [
    // Replace this with your actual list of GalleryItems
    GalleryItem(id: '1', image: 'images/img_1.png'),
    GalleryItem(id: '2', image: 'images/img_2.png'),
    GalleryItem(id: '3', image: 'images/img_4.png'),
    GalleryItem(id: '4', image: 'images/img_5.png'),
    GalleryItem(id: '5', image: 'images/img_2.png'),
    GalleryItem(id: '6', image: 'images/img_4.png'),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: PhotoView(imageProvider: NetworkImage('https://scontent.fdac11-1.fna.fbcdn.net/v/t39.30808-6/240233011_995073337991392_1325970435987442389_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=voydThRl8QkAX8GgIcT&_nc_oc=AQnsvrZJC3UG9bDaDmTKOWseM6mTji24yKwViico4gKVtCCU4wt4GMAdjRYJMTk77uI&_nc_ht=scontent.fdac11-1.fna&oh=00_AfCtpbL8OQcBSiwrsrt_1BXlZO7tprx1MKG3Z4hEWehyVg&oe=656CB108')),
    //
    //
    // );
    return Container(
      child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(galleryItems[index].image),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            heroAttributes: PhotoViewHeroAttributes(
                tag: galleryItems[index].id),
          );
        },
        itemCount: galleryItems.length,
        loadingBuilder: (context, event) =>
            Center(
              child: Container(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  value: event == null
                      ? 0
                      : event.cumulativeBytesLoaded /
                      (event.expectedTotalBytes ?? 1),
                ),
              ),
            ),
        backgroundDecoration: BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController(initialPage: currentIndex),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
  class GalleryItem {
  final String id;
  final String image;

  GalleryItem({required this.id, required this.image});

}




