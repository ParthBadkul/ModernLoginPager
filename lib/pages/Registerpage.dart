import 'package:easueuth/componenents/myButton.dart';
import 'package:easueuth/componenents/myTextFiled.dart';
import 'package:easueuth/componenents/squareTile.dart';
import 'package:easueuth/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RegisterPage extends StatefulWidget {
  final Function()? pa;

  RegisterPage({super.key, required this.pa});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

late final Function()? onTap;

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passWordController = TextEditingController();

  final rePasswordController = TextEditingController();

  // void signIn() async {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );
  //   // awaiting for response
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text, password: passWordController.text);
  //     Navigator.pop(context);
  //   } on FirebaseAuthException catch (e) {
  //     Navigator.pop(context);
  //     wrongEmailPassword(e.code);
  //   }

  //   // pop Circular
  // }

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // awaiting for response
    if (passWordController.text == rePasswordController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passWordController.text,
        );
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        wrongEmailPassword(e.code);
      }
    } else {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password doesnt match'),
          );
        },
      );
    }
  }

  void wrongEmailPassword(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                // Welcome , back
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  'Lets Create your Account',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.3,
                    color: Colors.black38,
                  ),
                ).animate().fadeIn(delay: 100.milliseconds).slideY(),

                // username Textfield
                const SizedBox(
                  height: 50,
                ),
                MytextField(
                  controller: emailController,
                  hintText: "Username",
                  obsecure: false,
                ),

                // password TExt field
                const SizedBox(
                  height: 10,
                ),
                MytextField(
                    controller: passWordController,
                    hintText: 'Password',
                    obsecure: true),
                //sign in
                const SizedBox(
                  height: 15,
                ),
                MytextField(
                    controller: rePasswordController,
                    hintText: 'Confirm Password',
                    obsecure: true),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
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
                const SizedBox(
                  height: 20,
                ),

                SignIn(
                  signIn: signUp,
                  task: 'Sign Up',
                ),

                //or continue with
                const SizedBox(
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
                    const Padding(
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
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SqaureTile(
                        tap: () => Authservice().signInWithGoogle(),
                        imagePath: 'assets/images/apple.png'),
                    SizedBox(
                      width: 15,
                    ),
                    SqaureTile(
                        tap: () {}, imagePath: 'assets/images/google.png'),
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
                      'Already have an account ?',
                      style: TextStyle(color: Colors.black38),
                    ),
                    GestureDetector(
                      onTap: widget.pa,
                      child: Text(
                        '   Sign In',
                        style: TextStyle(
                          color: Colors.lightBlue[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
