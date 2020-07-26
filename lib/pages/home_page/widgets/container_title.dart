import 'package:WAStickers/models/sticker_packs_model.dart';
import 'package:WAStickers/pages/sticker_list_page.dart/sticker_list_page.dart';
import 'package:flutter/material.dart';

class ContainerTitle extends StatelessWidget {
  final String str;
  final StickerPackModel stickerPackModel;
  const ContainerTitle({@required this.str, @required this.stickerPackModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            str,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => StickerListPage(
                        stickerPackModel: stickerPackModel,
                        title: str,
                      )));
            },
            child: Text(
              "View All",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple),
            ),
          )
        ],
      ),
    );
  }
}
