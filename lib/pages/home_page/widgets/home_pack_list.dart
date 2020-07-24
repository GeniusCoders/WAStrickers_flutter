import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';

import 'sticker_image_container.dart';

class HomePackList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            StickerImageContainer(
              color: Color(0xff30e848),
              str: 'sticker_packs/1/tray_img.png',
            ),
            StickerImageContainer(
              color: Color(0xff380541),
              str: 'sticker_packs/2/tray_img.png',
            ),
            StickerImageContainer(
              color: Color(0xff90e0f8),
              str: 'sticker_packs/3/tray_img.png',
            ),
          ],
        ),
      ),
    );
  }
}
