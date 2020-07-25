import 'package:flutter/material.dart';

class StickerTryImage extends StatelessWidget {
  final String imgUrl;

  const StickerTryImage({@required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 120,
      child: Image.asset(imgUrl),
      decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10))),
    );
  }
}
