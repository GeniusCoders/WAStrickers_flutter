import 'package:WAStickers/style/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPress;

  const Button({@required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: green, borderRadius: BorderRadius.circular(16)),
        child: Text(
          'Add To WhatsApp',
          style: TextStyle(color: white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
