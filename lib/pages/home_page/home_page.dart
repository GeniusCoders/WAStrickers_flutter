import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF3F5FB),
        body: Home(),
      ),
    );
  }
}
