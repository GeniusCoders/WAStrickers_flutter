import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StickerInfo extends StatelessWidget {
  final String stickerName;
  final String stickerOwner;

  const StickerInfo({required this.stickerName, required this.stickerOwner});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FittedBox(
          child: Text(
            stickerName,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          'By $stickerOwner',
          style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black45,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
