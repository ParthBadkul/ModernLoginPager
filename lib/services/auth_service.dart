import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authservice {
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUSer = await GoogleSignIn().signIn();

    //obtain auth detail fromm req
    final GoogleSignInAuthentication? gAuth = await gUSer!.authentication;
    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken, idToken: gAuth?.idToken);
    //finally sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
