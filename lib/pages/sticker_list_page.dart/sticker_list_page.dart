import 'package:WAStickers/models/sticker_packs_model.dart';
import 'package:WAStickers/pages/sticker_view_page/sticker_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StickerListPage extends StatelessWidget {
  final StickerPackModel stickerPackModel;
  final String title;
  const StickerListPage({required this.stickerPackModel, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0.w),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: stickerPackModel.stickerPacks!.length,
                itemBuilder: (context, index) {
                  final _data = stickerPackModel.stickerPacks![index];
                  return ListTile(
                    onTap: () {
                      final _data = stickerPackModel.stickerPacks![index];
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => StickerViewPage(
                          stickerPack: _data,
                        ),
                      ));
                    },
                    title: Text("${_data.name}"),
                    subtitle: Text("${_data.publisher}"),
                    leading: Image.asset(
                        "sticker_packs/${_data.identifier}/${_data.trayImageFile}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
