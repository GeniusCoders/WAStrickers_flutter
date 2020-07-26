import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPress;
  final bool isInstall;
  const Button({@required this.onPress, @required this.isInstall});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isInstall ? Color(0xFFcccccc) : green,
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          isInstall ? 'Added' : 'Add To WhatsApp',
          style: TextStyle(color: white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
