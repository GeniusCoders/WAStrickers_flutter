import 'package:flutter/material.dart';

class StickerPacks extends StatefulWidget {
  final List stickerPack;
  final Color color;
  const StickerPacks({this.stickerPack, this.color});

  @override
  _StickerPacksState createState() => _StickerPacksState(stickerPack);
}

class _StickerPacksState extends State<StickerPacks> {
  List stickerPack;

  _StickerPacksState(this.stickerPack);

  @override
  Widget build(BuildContext context) {
    List totalStickers = stickerPack[4];
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Pack Stickers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemCount: totalStickers.length,
                itemBuilder: (context, index) {
                  var stickerImg =
                      "sticker_packs/${stickerPack[0]}/${totalStickers[index]['image_file']}";
                  return Container(
                    decoration: BoxDecoration(
                        color: widget.color.withOpacity(.4),
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        stickerImg,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
