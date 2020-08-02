import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StickerImageContainer extends StatefulWidget {
  final Color color;
  final String str;
  final String name;
  final String stickerCount;
  const StickerImageContainer({
    @required this.color,
    @required this.str,
    @required this.name,
    @required this.stickerCount,
  });

  @override
  _StickerImageContainerState createState() => _StickerImageContainerState();
}

class _StickerImageContainerState extends State<StickerImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.h,
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 140.h,
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(6.w))),
            child: Image.asset(widget.str),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(6.w)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FittedBox(
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  '${widget.stickerCount} Stickers',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                      color: black),
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
