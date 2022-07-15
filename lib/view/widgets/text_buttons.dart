import 'package:flutter/material.dart';

// #############################
// * Blue Border Text Button
// #############################

class BlueBorderTextButton extends StatelessWidget {
  BlueBorderTextButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.isblue = true,
  }) : super(key: key);

  Function() onPress;
  String text;
  bool isblue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: isblue ? Colors.blue[700] : Colors.white,
        border: isblue
            ? Border.all(color: Colors.transparent)
            : Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            color: isblue ? Colors.white : Colors.black38,
          ),
        ),
      ),
    );
  }
}

// #############################
// * "Blue Text" Text Button
// #############################

class BlueTextButton extends StatelessWidget {
  BlueTextButton({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  Function() onPress;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue[700],
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
