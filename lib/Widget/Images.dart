import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

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