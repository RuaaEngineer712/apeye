
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> signIn(String email, String password) async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;
  }
  catch(e){
    print(e);
    return false;
  }
}

Future<bool> register(String email, String password) async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return true; 
  } on FirebaseAuthException catch(e){
    if(e.code == 'weak-password'){
      print('the password is too weak');
    }
    else if(e.code == 'email-already-in-use'){
      print('account is already exist');
    }
    return false;
  }
  catch(e){
    print(e.toString());
    return false;
  }
}

class DatabaseUserManager {
  final CollectionReference Interests = FirebaseFirestore.instance.collection('Interests');

Future<void> userData(String email, String interest) async{
  try{
    await Interests.doc().set({email, interest});
  }   
  catch(e){
    print(e.toString());
  }
}
}

// class User{
//   final String uid;


//   User({required this.uid});
// }

// class AuthBase{

  

//   User _userFromFireBase(FirebaseAuth user){
//     return User(uid: user.uid);
//   }

//   Future<void> registerWithEmailAndPassword(String email, String password) async {
//     try {
//       final authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//       return _userFromFireBase(authResult.user);
//     }
//     catch (e){
//       print(e.toString());
//     }
//   }

//   Future<void> loginWithEmailAndPassword(String email, String password) async {
//     try {
//       final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
//       return _userFromFireBase(authResult.user);
//     } 
//     catch(e){
//       print(e.toString());
//     } 
//   }

//   Future<void> logout() async{
//     try {
//       await FirebaseAuth.instance.signOut();
//     }
//     catch(e){
//       print(e.toString());
//     }
//   }
// }