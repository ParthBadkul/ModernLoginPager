import 'package:easueuth/pages/login_page.dart';
import 'package:flutter/material.dart';

class SqaureTile extends StatelessWidget {
  SqaureTile({super.key, required this.imagePath, required this.tap});
  final String imagePath;
  final Function()? tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
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
      ),
    );
  }
}
