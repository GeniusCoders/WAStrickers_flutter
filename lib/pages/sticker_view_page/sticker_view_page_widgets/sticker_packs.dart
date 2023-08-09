import 'package:WAStickers/models/sticker_packs_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StickerPacks extends StatefulWidget {
  final StickerPacksList stickerPack;
  final Color color;
  const StickerPacks({required this.stickerPack, required this.color});

  @override
  _StickerPacksState createState() => _StickerPacksState(stickerPack);
}

class _StickerPacksState extends State<StickerPacks> {
  StickerPacksList stickerPack;

  _StickerPacksState(this.stickerPack);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0.w),
            child: Text(
              'Pack Stickers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemCount: stickerPack.stickers!.length,
                itemBuilder: (context, index) {
                  var stickerImg =
                      "sticker_packs/${stickerPack.identifier}/${stickerPack.stickers![index].imageFile}";
                  return Container(
                    decoration: BoxDecoration(
                        color: widget.color.withOpacity(.4),
                        borderRadius: BorderRadius.circular(10.w)),
                    margin: EdgeInsets.all(10.w),
                    child: Padding(
                      padding: EdgeInsets.all(4.0.w),
                      child: Image.asset(
                        stickerImg,
                        width: 100.w,
                        height: 100.h,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
