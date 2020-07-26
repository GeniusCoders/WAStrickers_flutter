import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';

import 'sticker_image_container.dart';

class AllPackList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.count(
          // physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: <Widget>[
            StickerImageContainer(
              color: Color(0xff380541),
              str: 'sticker_packs/2/tray_img.png',
            ),
            StickerImageContainer(
              color: Color(0xff380541),
              str: 'sticker_packs/2/tray_img.png',
            ),
          ],
        ),
      ),
    );
  }
}
