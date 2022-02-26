
// import 'dart:js';

// import 'dart:html';

// import 'dart:html';

import 'dart:ffi';

import 'package:apeye/API/model/job.dart';
import 'package:apeye/app_bar/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


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

Future<bool> updateProfile(String old, String email, String password) async{
  try{
      
      final CollectionReference Interests = FirebaseFirestore.instance.collection('Users');
      FirebaseAuth.instance.currentUser?.updateEmail(email);
      FirebaseAuth.instance.currentUser?.updatePassword(password);

      // Future<DocumentSnapshot<Object?>> user =  Interests.doc(old).get();  

      final querySnapshot = await Interests.where('email' , isEqualTo: old).get();

      for (var doc in querySnapshot.docs) {
        await Interests.doc(doc.id).update({
          'email' : email
        });
      }

      //.update({email: email, password: password});
      print("the old email id:"+old);
      print("the new email id:"+email);

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

  final _FirebaseAuth = FirebaseAuth.instance;

  final CollectionReference Interests = FirebaseFirestore.instance.collection('Users');
    final CollectionReference posts = FirebaseFirestore.instance.collection('SavedPost_test');

    final CollectionReference test = FirebaseFirestore.instance.collection('Interest_test');

Future<void> logout() async{
  try {
    await FirebaseAuth.instance.signOut();
  }
  catch(e){
    print(e.toString());
  }
}

Future<void> userData(String email, Array interest) async{
  try{
    
    await Interests.doc().set({email : email , interest: interest});
  }   
  catch(e){
    print(e.toString());
  }
}

Future<void> save_post(String id, String name) async{
  try{
    
    await posts.doc(id).set({'title': name});
    
  }   
  catch(e){
    print(e.toString());
  }
}



Future<String> getCurrentID() async{
  String uid = (await _FirebaseAuth.currentUser)!.uid;
  return uid;
}







// Future<void> testData(int id, String email, String interest) async{
//   try{
//     test.doc().set({});
//     await test.doc(email).set({'email':email, 'interest': });
//   }   
//   catch(e){
//     print(e.toString());
//   }
// }

// Future<void> setEmail(String email) async{
//   try{
//     await Interests.doc(email).set({Interests: email});

//     await Interests.doc(email).set({Interests: email});
//   }   
//   catch(e){
//     print(e.toString());
//   }
}

// Future<String> getEmail() async{
//   try{
//     final Stream<QuerySnapshot> useres = FirebaseFirestore.instance.collection("Users").snapshots();
    
//     return data;
//   }   
//   catch(e){
//     print(e.toString());
//     return "Failed";
//   }
// }





// }
// Future<String> getEmail() async{
//   try{
//     Interests email = await Interests.doc().get();
//     return 
//   }   
//   catch(e){
//     print(e.toString());
//   }
// }
// Future<void> getInterest() async{
//   try{
//     await Interests.doc().get();
//   }   
//   catch(e){
//     print(e.toString());
//   }
// }
// }

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