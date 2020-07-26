import 'package:WAStickers/bloc/sticker_bloc.dart';
import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF3F5FB),
        body: BlocProvider<StickerBloc>(
            create: (_) => StickerBloc(), child: Home()),
      ),
    );
  }
}
