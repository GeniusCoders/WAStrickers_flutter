import 'package:WAStickers/models/sticker_packs_model.dart';
import 'package:flutter/material.dart';
import 'sticker_image_container.dart';
import 'package:WAStickers/pages/sticker_view_page/sticker_view_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePackList extends StatelessWidget {
  final List data;
  final StickerPackModel stickerPackModel;
  const HomePackList({required this.data, required this.stickerPackModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                final _data = stickerPackModel
                    .stickerPacks![int.parse(data[index]['Index']) - 1];
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => StickerViewPage(
                    stickerPack: _data,
                  ),
                ));
              },
              child: StickerImageContainer(
                color: Color(data[index]['Color']),
                str:
                    'sticker_packs/${stickerPackModel.stickerPacks![int.parse(data[index]['Index']) - 1].identifier}/tray_img.png',
                name: data[index]['Name'],
                stickerCount: data[index]['Sticker_Count'],
              ),
            );
          },
        ),
      ),
    );
  }
}
