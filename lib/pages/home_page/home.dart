import 'package:WAStickers/pages/home_page/widgets/featured_banners.dart';
import 'package:WAStickers/pages/home_page/widgets/home_pack_list.dart';
import 'package:WAStickers/pages/home_page/widgets/sticker_image_container.dart';
import 'package:flutter/material.dart';

import 'widgets/container_title.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          ContainerTitle(
            str: 'Featured Packs',
            isShowButton: false,
          ),
          SizedBox(
            height: 6,
          ),
          FeaturedBanner(),
          SizedBox(
            height: 10,
          ),
          ContainerTitle(
            str: 'Trending Packs',
          ),
          HomePackList(),
          ContainerTitle(
            str: 'New Packs',
          ),
          HomePackList()
        ],
      ),
    );
  }
}
