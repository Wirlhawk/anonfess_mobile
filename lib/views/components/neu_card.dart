import 'package:flutter/material.dart';

class NeuCard extends StatelessWidget {
  final Widget child;
  const NeuCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 1, right: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 5),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
