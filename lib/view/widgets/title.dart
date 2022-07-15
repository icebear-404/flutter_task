import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  TitleCustom({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
