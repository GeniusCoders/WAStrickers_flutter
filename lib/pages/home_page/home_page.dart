import 'package:WAStickers/bloc/sticker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      ScreenUtil.init(
        context,
        designSize: Size(360.0, 780),
      );
    } else {
      ScreenUtil.init(
        context,
        designSize: Size(900.0, 1224.0),
      );
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
