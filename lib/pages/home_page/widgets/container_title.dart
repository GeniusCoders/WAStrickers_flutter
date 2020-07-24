import 'package:flutter/material.dart';

class ContainerTitle extends StatelessWidget {
  final String str;
  final bool isShowButton;
  const ContainerTitle({@required this.str, this.isShowButton = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            str,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          isShowButton
              ? InkWell(
                  child: Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
