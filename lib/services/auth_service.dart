import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  //sign in with google
  signInWithGoogle() async{
    //begin interactive sign-in process with Google
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      //obtain auth details from request
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      //create a new credetial for user
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
      );
      //finally lets sign in the user
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
      if (e.code == 'account-exists-with-different-credential') {
        //handle the error here
      } else if (e.code == 'invalid-credential') {
        //handle the error here
      }
    }
  }

  //sign in with apple
  signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ]
      );

      final appleCredential = OAuthProvider('apple.com').credential(
          idToken: credential.identityToken,
          accessToken: credential.authorizationCode
      );
      return await FirebaseAuth.instance.signInWithCredential(appleCredential);

    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
      if (e.code == 'account-exists-with-different-credential') {
        //handle the error here
      } else if (e.code == 'invalid-credential') {
        //handle the error here
      }
    }
  }

  //sign in with facebook
  signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);
    return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}