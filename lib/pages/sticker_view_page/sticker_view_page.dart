import 'package:WAStickers/bloc/sticker_bloc.dart';
import 'package:WAStickers/models/sticker_packs_model.dart';
import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'sticker_view_page_widgets/sticker_info_top.dart';
import 'sticker_view_page_widgets/sticker_packs.dart';

class StickerViewPage extends StatefulWidget {
  final StickerPacksList stickerPack;

  const StickerViewPage({required this.stickerPack});

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
    Color color = await _getColorCode(AssetImage(
        'sticker_packs/${widget.stickerPack.identifier}/tray_img.png'));
    setState(() {
      colorCode = color;
    });
  }

  _onShare() async {
    final ByteData bytes = await rootBundle.load(
        "sticker_packs/${widget.stickerPack.identifier}/${widget.stickerPack.trayImageFile}");
    var pngBytes = bytes.buffer.asUint8List();

    // await Share.file('Share Sticker', 'sticker.png', pngBytes, 'image/png',
    //     text:
    //         'To Add this sticker in your WhatsApp Download this app https://play.google.com/store/apps/details?id=com.geniushub.WAStickers ');
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
          actions: <Widget>[
            IconButton(
              onPressed: _onShare,
              icon: Icon(Icons.share),
            )
          ],
        ),
        body: BlocProvider<StickerBloc>(
            create: (_) => StickerBloc(), child: getStickerView()));
  }

  Widget getStickerView() {
    return BlocConsumer<StickerBloc, StickerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BlocProvider.value(
                    value: BlocProvider.of<StickerBloc>(context),
                    child: StickerInfoTop(
                      stickerPack: widget.stickerPack,
                      color: colorCode,
                    ),
                  ),
                  Expanded(
                      child: StickerPacks(
                    stickerPack: widget.stickerPack,
                    color: colorCode,
                  ))
                ],
              ),
            ),
            Container(
              child: state is LoadingState ? Loading() : Container(),
            )
          ],
        );
      },
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

  return paletteGenerator.dominantColor!.color;
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints.expand(height: MediaQuery.of(context).size.height),
      color: black.withOpacity(.3),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
