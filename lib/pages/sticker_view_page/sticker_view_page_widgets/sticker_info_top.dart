import 'package:WAStickers/bloc/sticker_bloc.dart';
import 'package:WAStickers/models/sticker_packs_model.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whatsapp_stickers/flutter_whatsapp_stickers.dart';
import 'button.dart';
import 'sticker_info.dart';
import 'sticker_try_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StickerInfoTop extends StatefulWidget {
  final StickerPacksList stickerPack;
  final Color color;
  const StickerInfoTop({required this.stickerPack, required this.color});

  @override
  _StickerInfoTopState createState() => _StickerInfoTopState(stickerPack);
}

class _StickerInfoTopState extends State<StickerInfoTop> {
  StickerPacksList stickerPack;
  bool isInstalled = false;

  _StickerInfoTopState(this.stickerPack);

  @override
  void initState() {
    super.initState();
    _checkInstallationStatuses();
  }

  void _checkInstallationStatuses() async {
    bool _install = await WhatsAppStickers()
        .isStickerPackInstalled(widget.stickerPack.identifier ?? "");
    setState(() {
      isInstalled = _install;
    });
  }

  _onAddSticker() async {
    bool isInstalled = await DeviceApps.isAppInstalled('com.whatsapp');
    if (isInstalled) {
      BlocProvider.of<StickerBloc>(context).add(AddSticker(
          context: context,
          id: stickerPack.identifier ?? '',
          name: stickerPack.name ?? ''));
    } else {
      _showMyDialog('Please Install WhatsApp to add sticker pack');
    }
  }

  Future<void> _showMyDialog(String str) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Sticker Pack',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  str,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StickerBloc, StickerState>(
      listener: (context, state) {
        if (state is StickerAdded) {
          setState(() {
            isInstalled = true;
          });
        }
      },
      child: Container(
        height: 180.h,
        child: Stack(
          children: <Widget>[
            Container(
              height: 120.h,
              decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12.w))),
              child: Container(),
            ),
            Positioned(
              top: 10.h,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(1, 2), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    StickerTryImage(
                      imgUrl:
                          'sticker_packs/${stickerPack.identifier}/${stickerPack.trayImageFile}',
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        height: 156.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            StickerInfo(
                              stickerName: '${stickerPack.name}',
                              stickerOwner: '${stickerPack.publisher}',
                            ),
                            Button(
                              onPress: _onAddSticker,
                              isInstall: isInstalled,
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
      ),
    );
  }
}
