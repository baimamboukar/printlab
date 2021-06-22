import 'package:firebase_auth/firebase_auth.dart';

/*
The class Authentication will handle all the authentication states...
  ♦ _auth: Firebase auth object...
  ♦ get authStateChanges: listen to the auth and returns the actual and updated user
  

*/

class Authentication {
  final FirebaseAuth _auth;
  Authentication(this._auth);

  Stream<User> get authStateChange => _auth.authStateChanges();

  /*
    ---------------SIGN UP IN FUNCTION--------------
    The function takes as paramter the name and the password of the user
    and call the createUserWithEmailAndPassword() function from firebaseAuth
  */
  Future<String> signUp(
      {String email,
      String password,
      String name,
      String phone,
      String address}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (err) {
      print(err.message);
      return err.message;
    }
  }

  /*
    ---------------SING IN FUNCTION--------------
    The function takes as paramter the name and the password of the user
    and call the signInWithEmailAndPassword() function from firebaseAuth
  */
  Future<void> logIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (err) {
      print(err.message);
    }
  }

  /*
    ----------------LOG OUT--------------------
    Logs out the actual user
  */

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (err) {
      print(err.message);
    }
  }
}
