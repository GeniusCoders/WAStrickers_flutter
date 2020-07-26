import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';

class StickerImageContainer extends StatefulWidget {
  final Color color;
  final String str;

  const StickerImageContainer({
    @required this.color,
    @required this.str,
  });

  @override
  _StickerImageContainerState createState() => _StickerImageContainerState();
}

class _StickerImageContainerState extends State<StickerImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(6))),
            child: Image.asset(widget.str),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Skelton',
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '26 Stickers',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w800, color: black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//  Color(0xff30e848)
// Color(0xff380541)
// Color(0xff90e0f8)
