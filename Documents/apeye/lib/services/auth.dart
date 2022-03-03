
// import 'dart:js';

// import 'dart:html';

// import 'dart:html';

import 'dart:ffi';

import 'package:apeye/API/model/News.dart';
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

Future<void> userData(String email, Map<String , String> interest) async{
  try{    
    await Interests.doc().set({
      "email" : email ,
      "interest" : interest
    }, SetOptions(merge: true),
    );
  }   
  catch(e){
    print(e.toString());
  }
}


Future<void> SavedPost(String email, String image, String title, String time, String description) async{
  try{    
    await posts.doc().set({
      "image": image,
      "title": title,
      "time": time,
      "description": description,
      "email" : email
    });
  }
  catch(e){
    print(e.toString());
  }
}




// Future<String> getUserData(String email) async{
//   try{
//       final querySnapshot = await Interests.where('email' , isEqualTo: email).get();
//       String interest_result = querySnapshot.docs.
//       for (var doc in querySnapshot.docs) {
//         return interest_result = doc.get('interest');
//       }
//       return interest_result;
//   }
//   catch(e){
//     return e.toString();
//   }
// }

Future<bool> updateProfile(String old, String email, String password , Map<String , String> interest) async{
  try{
      
      FirebaseAuth.instance.currentUser?.updateEmail(email);
      if (!password.isEmpty){
        FirebaseAuth.instance.currentUser?.updatePassword(password);
      }

      // Future<DocumentSnapshot<Object?>> user =  Interests.doc(old).get();  

      final querySnapshot = await Interests.where('email' , isEqualTo: old).get();

      for (var doc in querySnapshot.docs) {
        await Interests.doc(doc.id).update({
          'email' : email,
          "interest" : interest
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


Future<void> updateInterest(String email, Map<String , String> interest) async{
  try{

      

      final querySnapshot = await Interests.where('email' , isEqualTo: email).get();
      for (var doc in querySnapshot.docs) {
        await Interests.doc(doc.id).update({
          'interest' : interest
        });
      }
  }
  catch(e){
    print(e.toString());
  }

}



Future<String> getCurrentID() async{
  String uid = (await _FirebaseAuth.currentUser)!.uid;
  return uid;
}



Future<dynamic> getSavedPostTitle(String email) async{
  try{ 
    String title;
    final data = (await posts.doc(email).get());
    return data;
    print("************************* ********************* ***********");
    // print (querySnapshot);
    
    
  }
  catch(e){
    return e.toString();
  }
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