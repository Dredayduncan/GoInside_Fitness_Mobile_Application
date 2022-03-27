import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  // Instance variables
  final _firebaseAuth = FirebaseAuth.instance; //Firebase instance

  //Track authentication changes
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  //Getting Current user
  User? get currentUser => FirebaseAuth.instance.currentUser;

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
        EmailAuthProvider.credential(email: email, password: password)
    );

    return userCredential.user;
  }

  // Sign up with email and password
  Future<User?>createUserWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );

    return userCredential.user;
  }

  //Log the user out of the application
  Future<void> signOut() async {
    //Sign out of firebase
    await _firebaseAuth.signOut();
  }
}