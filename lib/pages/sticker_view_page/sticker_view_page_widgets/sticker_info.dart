import 'package:flutter/material.dart';

class StickerInfo extends StatelessWidget {
  final String stickerName;
  final String stickerOwner;

  const StickerInfo({@required this.stickerName, this.stickerOwner});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FittedBox(
          child: Text(
            stickerName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          'By $stickerOwner',
          style: TextStyle(
              fontSize: 14, color: Colors.black45, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
