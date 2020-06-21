
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seedeal02/screens/MenuPage.dart';
import 'package:seedeal02/screens/SignUpPage.dart';


//============================================================================
// DECLARE VARIABLE
//============================================================================  

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

  

//=================================================================================
// FUNCTION#1 LOGIN WITH GOOGLE
//=================================================================================
Future<FirebaseUser> loginWithGoogle() async {
  final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  AuthResult authResult = await _auth.signInWithCredential(credential);
  return authResult.user;
}

//=================================================================================
// FUNCTION#2 LOGIN BY FIREBASE (USER NAME AND PASSWORD)
//=================================================================================
Future<bool> loginWithEmail(BuildContext context,
    {@required String email, @required String password}) {
  return _auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((result) {
    print("Welcome " + result.user.uid);
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => MenuPage(
                // user: result.user,
              )),
    );
    return true;
  }).catchError((e) {
    print(e);
    switch (e.code) {
      case "ERROR_WRONG_PASSWORD":
        print("Wrong Password! Try again.");
        break;
      case "ERROR_INVALID_EMAIL":
        print("Email is not correct!, Try again");
        break;
      case "ERROR_USER_NOT_FOUND":
        print("User not found! Register first!");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpPage()),
        );
        break;
      case "ERROR_USER_DISABLED":
        print("User has been disabled!, Try again");
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        print(
            "Sign in disabled due to too many requests from this user!, Try again");
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        print(
            "Operation not allowed!, Please enable it in the firebase console");
        break;
      default:
        print("Unknown error");
    }
    return false;
  });
}

//=================================================================================
// FUNCTION#3 REGISTER WITH EMAIL
//=================================================================================
Future<bool> registerWithEmail(
    {@required email, @required password, @required repassword}) {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  return _auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((data) {
    print("Registation Success");
    print(data.user.uid);
    return true;
  }).catchError((e) {
    print("Error: " + e);
    return false;
  });
}


//=================================================================================
// FUNCTION#4 LOGIN BY APPLE
//=================================================================================
Future<FirebaseUser> loginWithApple() async {
  if (await AppleSignIn.isAvailable()) {
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);
    AuthCredential credential;
    switch (result.status) {
      case AuthorizationStatus.authorized:
        credential = OAuthProvider(providerId: "apple.com").getCredential(
          idToken: String.fromCharCodes(result.credential.identityToken),
          accessToken:
              String.fromCharCodes(result.credential.authorizationCode),
        );
        break;
      case AuthorizationStatus.error:
        print("Error: " + result.error.localizedDescription);
        throw PlatformException(
          code: "SIGN_IN_WITH_APPLE_FAILED",
          details: result.error.localizedDescription,
        );
        break;
      case AuthorizationStatus.cancelled:
        print("User Cancelled");
        throw PlatformException(
          code: "USER_CANCELLED_LOGIN",
          details: "The user calcelled the login process",
        );
        break;
    }
    return (await _auth.signInWithCredential(credential)).user;
  } else {
    print("Unsupported sign in with apple");
    throw PlatformException(
      code: "UNSUPPORTED_SIGN_IN_WITH_APPLE",
      details: "There is no sign in with apple supported on this device",
    );
  }
}