import 'package:WAStickers/bloc/sticker_bloc.dart';
import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      ScreenUtil.init(context,
          width: 360.0, height: 780.0, allowFontScaling: true);
    } else {
      ScreenUtil.init(context,
          width: 900.0, height: 1224.0, allowFontScaling: true);
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF3F5FB),
        body: BlocProvider<StickerBloc>(
            create: (_) => StickerBloc(), child: Home()),
      ),
    );
  }
}
