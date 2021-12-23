import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String? uid;
String? name;
String? userEmail;
String? imageUrl;

/// For checking if the user is already signed into the
/// app using Google Sign In
Future getUser() async {
  //await Firebase.initializeApp();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
        apiKey: "AIzaSyA3dZoOp51MM3LA41413LlgOEbyq9gphJ0",
        authDomain: "beauty-parlor-335410.firebaseapp.com",
        projectId: "beauty-parlor-335410",
        storageBucket: "beauty-parlor-335410.appspot.com",
        messagingSenderId: "809495811354",
        appId: "1:809495811354:web:5966e83613b56e0aacc8a3",
        measurementId: "G-DETW32B72M"
    ),
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool authSignedIn = prefs.getBool('auth') ?? false;

  final User? user = _auth.currentUser;

  if (authSignedIn == true) {
    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;
    }
  }
}

/// For authenticating user using Google Sign In
/// with Firebase Authentication API.
///
/// Retrieves some general user related information
/// from their Google account for ease of the login process
Future<User?> signInWithGoogle() async {
  //await Firebase.initializeApp();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
        apiKey: "AIzaSyA3dZoOp51MM3LA41413LlgOEbyq9gphJ0",
        authDomain: "beauty-parlor-335410.firebaseapp.com",
        projectId: "beauty-parlor-335410",
        storageBucket: "beauty-parlor-335410.appspot.com",
        messagingSenderId: "809495811354",
        appId: "1:809495811354:web:5966e83613b56e0aacc8a3",
        measurementId: "G-DETW32B72M"
    ),
  );
  User? user;
print("signInWithGoogle ${kIsWeb}");
  if (kIsWeb) {
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
      await _auth.signInWithPopup(authProvider);

      user = userCredential.user;
    } catch (e) {
      print(e);
    }
  } else {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print('The account already exists with a different credential.');
        } else if (e.code == 'invalid-credential') {
          print('Error occurred while accessing credentials. Try again.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  if (user != null) {
    uid = user.uid;
    name = user.displayName;
    userEmail = user.email;
    imageUrl = user.photoURL;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', true);
  }

  return user;
}

Future<User?> registerWithEmailPassword(String email, String password) async {
  //await Firebase.initializeApp();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
        apiKey: "AIzaSyA3dZoOp51MM3LA41413LlgOEbyq9gphJ0",
        authDomain: "beauty-parlor-335410.firebaseapp.com",
        projectId: "beauty-parlor-335410",
        storageBucket: "beauty-parlor-335410.appspot.com",
        messagingSenderId: "809495811354",
        appId: "1:809495811354:web:5966e83613b56e0aacc8a3",
        measurementId: "G-DETW32B72M"
    ),
  );
  User? user;
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    user = userCredential.user;

    print("registerWithEmailPassword ${userCredential.user}");
    if (user != null) {
      uid = user.uid;
      userEmail = user.email;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }

  return user;
}

Future<User?> signInWithEmailPassword(String email, String password) async {
 // await Firebase.initializeApp();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
        apiKey: "AIzaSyA3dZoOp51MM3LA41413LlgOEbyq9gphJ0",
        authDomain: "beauty-parlor-335410.firebaseapp.com",
        projectId: "beauty-parlor-335410",
        storageBucket: "beauty-parlor-335410.appspot.com",
        messagingSenderId: "809495811354",
        appId: "1:809495811354:web:5966e83613b56e0aacc8a3",
        measurementId: "G-DETW32B72M"
    ),
  );
  User? user;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;

    print("signInWithEmailPassword ${userCredential.user}");
    if (user != null) {
      uid = user.uid;
      userEmail = user.email;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('auth', true);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.');
    }
  }

  return user;
}

Future<String> signOut() async {
  await _auth.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);
  print("signOut ");
  uid = null;
  userEmail = null;

  return 'User signed out';
}

/// For signing out of their Google account
void signOutGoogle() async {
  await googleSignIn.signOut();
  await _auth.signOut();
  print("signOutGoogle ");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);

  uid = null;
  name = null;
  userEmail = null;
  imageUrl = null;

  print("User signed out of Google account");
}