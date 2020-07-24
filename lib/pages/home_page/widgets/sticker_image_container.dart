import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
                color: widget.color, borderRadius: BorderRadius.circular(6)),
            child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset(widget.str)),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
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
                  height: 2,
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

Future<Color> _getColor(ImageProvider image) async {
  final paletteGenerator = await PaletteGenerator.fromImageProvider(
    image,
    size: Size(96, 96),
    region: Offset.zero & Size(96, 96),
    maximumColorCount: 4,
  );

  return paletteGenerator.lightVibrantColor.color ?? Colors.black;
}

//  Color(0xff30e848)
// Color(0xff380541)
// Color(0xff90e0f8)
