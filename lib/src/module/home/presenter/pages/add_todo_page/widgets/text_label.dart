import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String message;
  TextLabel({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message ,style: TextStyle(
        color: Colors.black.withOpacity(0.8)
      ),),
    );
  }
}
