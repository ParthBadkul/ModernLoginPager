import 'package:easueuth/componenents/myButton.dart';
import 'package:easueuth/componenents/myTextFiled.dart';
import 'package:easueuth/componenents/squareTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passWordController = TextEditingController();

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // awaiting for response
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passWordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmail();
      } else if (e.code == 'wrong-password') {
        wrongPassword();
      }
    }

    // pop Circular
  }

  void wrongEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void wrongPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              //logo
              Icon(
                Icons.lock,
                size: 100,
              ),

              // Welcome , back
              SizedBox(
                height: 50,
              ),

              Text(
                'Welcome Back you\'ve been missed',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.3,
                  color: Colors.black38,
                ),
              ),

              // username Textfield
              SizedBox(
                height: 50,
              ),
              MytextField(
                controller: emailController,
                hintText: "Username",
                obsecure: false,
              ),

              // password TExt field
              SizedBox(
                height: 10,
              ),
              MytextField(
                  controller: passWordController,
                  hintText: 'Password',
                  obsecure: true),
              //sign in
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              SignIn(signIn: signIn),

              //or continue with
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.8,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),

              // apple+google Sigin in
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SqaureTile(imagePath: 'assets/images/apple.png'),
                  SizedBox(
                    width: 15,
                  ),
                  SqaureTile(imagePath: 'assets/images/google.png'),
                ],
              ),
              // not a member
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member ?',
                    style: TextStyle(color: Colors.black38),
                  ),
                  Text(
                    '   Register now',
                    style: TextStyle(
                      color: Colors.lightBlue[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
