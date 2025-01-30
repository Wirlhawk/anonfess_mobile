import 'package:anonfess_mobile/style/style.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Function()? onTap;
  const MessageCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Style.secondary,
              border: Border.all(width: 4),
              borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.center,
          child: Icon(
            Icons.check,
            size: 60,
          )),
    );
  }
}
