import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  final String id;
  const MessagePage({super.key, required this.id});

//  get message berdasarkan id

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(id),
    );
  }
}
