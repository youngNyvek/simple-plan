import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAdapter {
  static final authInstance = FirebaseAuth.instance;

  static Future<void> login() async {
    authInstance.signInWithProvider(GoogleAuthProvider());
  }
}
