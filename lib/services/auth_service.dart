import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //sign in
  Future<UserCredential> signIn(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
        );
      return userCredential;
    } on FirebaseException catch(e) {
      throw Exception(e.code);
    }
  }
  //sign up
  Future<UserCredential> signUp(String email, password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
        );
      return userCredential;
    } on FirebaseException catch(e) {
      throw Exception(e.code);
    }
  }
  //sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  //errors
}