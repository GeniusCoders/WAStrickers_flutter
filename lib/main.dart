import 'package:WAStickers/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final String title = 'Stickers';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'Avenir'),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
