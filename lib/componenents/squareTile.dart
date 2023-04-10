import 'package:flutter/material.dart';

class SqaureTile extends StatelessWidget {
  const SqaureTile({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(
        imagePath,
        height: 30,
      ),
    );
  }
}
