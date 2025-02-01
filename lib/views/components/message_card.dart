import 'package:anonfess_mobile/style/style.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
  final Function()? onTap;
  final bool isOpen;

  const MessageCard({
    super.key,
    this.onTap,
    this.isOpen = false,
  });

  @override
  _MessageCardState createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        margin: _isPressed
            ? EdgeInsets.only(top: 2.5, left: 2.5)
            : EdgeInsets.only(bottom: 2.5, right: 2.5),
        decoration: BoxDecoration(
          color: widget.isOpen ? Style.secondary : Style.primary,
          border: Border.all(width: 4),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: _isPressed ? Offset(0, 0) : Offset(2.5, 2.5),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: widget.isOpen
            ? Icon(Icons.check_rounded, size: 40)
            : Icon(Icons.mail_outline_rounded, size: 40),
      ),
    );
  }
}
