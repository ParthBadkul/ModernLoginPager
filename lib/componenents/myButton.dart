import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key, required this.signIn, required this.task});
  final Function()? signIn;
  final String task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: signIn,
        child: Text(
          '${task}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
