import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //get instance of firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get current user
  User? getCurrentUser() {}

  //sign in

  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    //try signing in
    try {
      // sign user in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    //catch errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

//sign up

  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    //try signing in
    try {
      // sign user in
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    //catch errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
//sign out
  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }
}
