import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_inside_fitness/services/rt_database.dart';

class Auth {

  // Instance variables
  final _firebaseAuth = FirebaseAuth.instance; //Firebase instance

  //Track authentication changes
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  //Getting Current user
  User? get currentUser => FirebaseAuth.instance.currentUser;

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try{
      final userCredential = await _firebaseAuth.signInWithCredential(
          EmailAuthProvider.credential(email: email, password: password)
      );

      return userCredential.user;
    }
    catch (e){
      return null;
    }



  }

  // Sign up with email and password
  Future<User?>createUserWithEmailAndPassword({required String email, required String password, required String name, required String contact, required String gender}) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );

    try {
      RTDatabase().userSignUp(
          userID: userCredential.user?.uid,
          fullName: name,
          contact: contact,
          email: userCredential.user?.email,
          gender: gender
      );
    } catch (e) {
      return null;
    }


    return userCredential.user;
  }

  //Log the user out of the application
  Future<void> signOut() async {
    //Sign out of firebase
    await _firebaseAuth.signOut();
  }
}