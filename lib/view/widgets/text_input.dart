import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

// #############################
// * Input Text Field
// #############################

class TextInputCustom extends StatelessWidget {
  TextInputCustom({
    Key? key,
    this.label = '',
    required this.controller,
    required this.hintText,
    this.ishidden = false,
    this.readOnly = false,
  }) : super(key: key);

  String label;
  TextEditingController controller;
  String hintText;
  bool ishidden;
  bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
          child: ishidden
              ? PasswordField(
                  controller: controller,
                  hintText: hintText,
                )
              : TextField(
                  readOnly: readOnly,
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: hintText,
                  ),
                ),
        ),
      ],
    );
  }
}

// #############################
// * Password Field
// #############################

class PasswordField extends StatefulWidget {
  PasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  TextEditingController controller;
  String hintText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isvisible,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: widget.hintText,
        // ~ IconButton Show/Hide Password
        suffixIcon: isvisible
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isvisible = false;
                  });
                },
                icon: const Icon(
                  FontAwesome.eye_slash,
                ),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    isvisible = true;
                  });
                },
                icon: const Icon(
                  FontAwesome.eye,
                ),
              ),
      ),
    );
  }
}
