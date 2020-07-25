import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'sticker_view_page_widgets/sticker_info_top.dart';
import 'sticker_view_page_widgets/sticker_packs.dart';

class StickerViewPage extends StatefulWidget {
  final List stickerPack;

  const StickerViewPage({@required this.stickerPack});

  @override
  _StickerViewPageState createState() => _StickerViewPageState();
}

class _StickerViewPageState extends State<StickerViewPage> {
  Color colorCode = Colors.white;

  @override
  void initState() {
    super.initState();
    _getColor();
  }

  _getColor() async {
    Color color = await _getColorCode(
        AssetImage('sticker_packs/${widget.stickerPack[0]}/tray_img.png'));
    setState(() {
      colorCode = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorCode,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StickerInfoTop(
                stickPack: widget.stickerPack,
                color: colorCode,
              ),
              Expanded(
                  child: StickerPacks(
                stickerPack: widget.stickerPack,
                color: colorCode,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

Future<Color> _getColorCode(ImageProvider image) async {
  final paletteGenerator = await PaletteGenerator.fromImageProvider(
    image,
    size: Size(96, 96),
    region: Offset.zero & Size(96, 96),
    maximumColorCount: 4,
  );

  return paletteGenerator.dominantColor.color ?? Colors.black;
}
