import 'package:WAStickers/pages/home_page/widgets/featured_banners.dart';
import 'package:WAStickers/pages/home_page/widgets/home_pack_list.dart';
import 'package:WAStickers/pages/home_page/widgets/sticker_image_container.dart';
import 'package:flutter/material.dart';

import 'widgets/all_pack_list.dart';
import 'widgets/container_title.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FeaturedBanner(),
            SizedBox(
              height: 10,
            ),
            ContainerTitle(
              str: 'Featured',
            ),
            SizedBox(
              height: 6,
            ),
            HomePackList(),
            SizedBox(
              height: 12,
            ),
            ContainerTitle(
              str: 'All Packs',
            ),
            SizedBox(
              height: 6,
            ),
            HomePackList()
          ],
        ),
      ),
    );
  }
}
