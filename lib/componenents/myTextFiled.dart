import 'package:flutter/material.dart';

class MytextField extends StatelessWidget {
  // const MytextField({super.key});
  final controller;
  final String hintText;
  final bool obsecure;
  MytextField({
    required this.controller,
    required this.hintText,
    required this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black26,
            )),
        obscureText: obsecure,
      ),
    );
  }
}
