import 'dart:async';
import 'package:boilerplate/models/post/http_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {

   try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
     print("resultt on login...................$result");
    // return user.uid;
    } 
      catch (e) {
        print("catch error in login................$e.message");
        // throw e;
           throw MyHttpException(e.message);
    //       switch (e.message) {
    //   case 'There is no user record corresponding to this identifier. The user may have been deleted.':
    //     errorType = authProblems.UserNotFound;
    //     break;
    //   case 'The password is invalid or the user does not have a password.':
    //     errorType = authProblems.PasswordNotValid;
    //     break;
    //   case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
    //     errorType = authProblems.NetworkError;
    //     break;
    //   // ...
    //   default:
    //     print('Case ${e.message} is not yet implemented');
    // }
   
      
    }
  }

  Future<String> signUp(String email, String password) async {
   try { AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password
        );
    FirebaseUser user = result.user;
    return user.uid;
    } catch(e) {
 print("catch error in login................$e.message");
        // throw e;
           throw MyHttpException(e.message);
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}