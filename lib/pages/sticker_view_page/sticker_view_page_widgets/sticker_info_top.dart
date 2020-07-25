import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';

import 'button.dart';
import 'sticker_info.dart';
import 'sticker_try_img.dart';

class StickerInfoTop extends StatefulWidget {
  final List stickPack;
  final Color color;
  const StickerInfoTop({this.stickPack, this.color});

  @override
  _StickerInfoTopState createState() => _StickerInfoTopState(stickPack);
}

class _StickerInfoTopState extends State<StickerInfoTop> {
  List stickerPack;
  final WhatsAppStickers _waStickers = WhatsAppStickers();

  _StickerInfoTopState(this.stickerPack);

  void _checkInstallationStatuses() async {
    var tempName = stickerPack[0];
    bool tempInstall =
        await WhatsAppStickers().isStickerPackInstalled(tempName);

    if (tempInstall == true) {
      if (!stickerPack[6].contains(tempName)) {
        setState(() {
          stickerPack[6].add(tempName);
        });
      }
    } else {
      if (stickerPack[6].contains(tempName)) {
        setState(() {
          stickerPack[6].remove(tempName);
        });
      }
    }
    print("${stickerPack[6]}");
  }

  @override
  Widget build(BuildContext context) {
    print(widget.color);
    print("______");
    return Container(
      height: 180,
      child: Stack(
        children: <Widget>[
          Container(
            height: 120,
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(12))),
            child: Container(),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Container(
              height: 140,
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(1, 2), // changes position of shadow
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  StickerTryImage(
                    imgUrl: 'sticker_packs/${stickerPack[0]}/${stickerPack[3]}',
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      height: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          StickerInfo(
                            stickerName: '${stickerPack[1]}',
                            stickerOwner: '${stickerPack[2]}',
                          ),
                          Button(
                            onPress: () {},
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
