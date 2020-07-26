import 'package:WAStickers/pages/home_page/home_page.dart';
import 'package:WAStickers/pages/sticker_view_page/sticker_view_page.dart';
import 'package:WAStickers/sticker_list.dart';
import 'package:WAStickers/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final String title = 'Stickers';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.teal[900], fontFamily: 'Avenir'),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> fakeBottomButtons = new List<Widget>();
//     fakeBottomButtons.add(
//       Container(
//         height: 50.0,
//       ),
//     );
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Trendy WhatsApp Stickers"),
//       ),
//       body: StaticContent(),
//       drawer: Drawer(
//         child: MyDrawer(),
//       ),
//       persistentFooterButtons: fakeBottomButtons,
//     );
//   }
// }
