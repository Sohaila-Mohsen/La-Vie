import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  static final _googleSignIn = GoogleSignIn();
  //GoogleSignInAccount? _user;
  //GoogleSignInAccount get user => _user!;

  /* Future<String?> getAccessToken() async {
    final googleUser = await _googleSignIn.signIn();
    print("object");
    if (googleUser == null) return "";
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    print("--------------------------------token :${googleAuth.accessToken}");
    return googleAuth.accessToken;
  } */

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}
