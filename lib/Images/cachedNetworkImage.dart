import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
class ImageShow extends StatefulWidget {
  const ImageShow({super.key});

  @override
  State<ImageShow> createState() => _ImageShowState();
}

class _ImageShowState extends State<ImageShow> {
  get child => null;

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      itemCount: 250,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) => CachedNetworkImage(imageUrl: 'https://loremflickr.com/100/100/music?lock=$index',
        placeholder: _loader,
          errorWidget: _error,
        ),


    );
    // Show On List
    // return ListView.builder(
    //     itemBuilder: (BuildContext context, int index)=> Card(
    //       child: Column(
    //         children: <Widget> [
    //           CachedNetworkImage(
    //               imageUrl: 'https://loremflickr.com/320/240/music?lock=$index',
    //               placeholder: (BuildContext context, String url)=> Container(
    //                 width: 320,
    //                 height: 320,
    //                 color: Colors.white,
    //                 ),
    //           ),
    //
    //
    //         ],
    //       ),
    //
    //     ),
    //   itemCount: 500,
    // );

    // Show On Card
    // return SingleChildScrollView(
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         _blurshImage(),
    //         Divider(
    //           height: 50,
    //         ),
    //         _sizedContainer(
    //           const Image(
    //               image: CachedNetworkImageProvider(
    //                 'https://instructor-academy.onlinecoursehost.com/content/images/2023/05/31_How-to-Create-a-Programming-Course_.jpg',
    //               ),
    //           )
    //         ),
    //         Divider(),
    //         _sizedContainer(
    //           const Image(image: CachedNetworkImageProvider(
    //             'https://static1.smartbear.co/smartbearbrand/media/images/blog/what%E2%80%99s-the-best-programming-language-to-learn-first.png?ext=.png'
    //           ),
    //           ),
    //         ),
    //
    //       ],
    //     ),
    //   ),
    //
    // );
  }

  Widget _blurshImage(){
    return SizedBox(
      child: CachedNetworkImage(
        placeholder: (context, url)=> const AspectRatio(
          aspectRatio: 1.6,
          child: BlurHash(hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj'),

        ),
          imageUrl: 'https://miro.medium.com/v2/resize:fit:1400/0*SPjH6EGSjLcMPv8Q.jpg'
        ,
        fit: BoxFit.cover,
      ),

    );
  }
  Widget _sizedContainer(Widget child){
    return SizedBox(
      width: 500,
      height: 250,
      child: Center(child:child),

    );
  }
  Widget _loader(BuildContext context, String url) {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _error(BuildContext context, String url, Object error) {
    return const Center(child: Icon(Icons.error));
  }
}
