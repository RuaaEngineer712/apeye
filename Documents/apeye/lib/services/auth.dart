import 'dart:ffi';

import 'package:apeye/API/model/News.dart';
import 'package:apeye/app_bar/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:googleapis/compute/v1.dart';
import 'package:googleapis/mybusinessverifications/v1.dart';


import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


Future<String> signIn(String email, String password) async{
  String verification;
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    verification = "Log in";
    return verification;
  }
  catch(e){
    print(e);
    return "wrong email or password";
  }
}
Future<String> register(String email, String password) async {
  String verification = '';
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
        verification = 'success';
        print(verification);
    return verification;
  } on FirebaseAuthException catch (e) {
     if (e.code == 'email-already-in-use') {
      verification = 'account is already exist';
    }
    else if (e.code == 'weak-password') {
      verification = 'the password is too weak';
    }
    print(verification);
    return verification;
  } catch (e) {
    print(e.toString());
    return e.toString();
  }
}

Future<bool> verification() async{
  try{
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    print("sent to email after verification");
    return true; 
  }
  catch(e){
    print(e.toString());
    return false;
  }
  
}

Future<bool> isVerified() async{
  try{
    bool isverified = await FirebaseAuth.instance.currentUser!.emailVerified? true : false;
    // print("sent to email after conforming");

    print("sent to email after" ); print(isverified);

    return isverified; 
    
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

    // final CollectionReference test = FirebaseFirestore.instance.collection('Interest_test');

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

Future<List> getInterest(String email) async{
  try{    
    print("***************" "************ \n\n\n\n\n before get interest"+ "\n\n\n "+ email); 
    var data = [];
    final querySnapshot = await Interests.where('email', isEqualTo: email).get()
    .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            data = doc['interest'].values.toList();
            // print("data : \t\t\t "+doc['interest']);
        });
    });
    
    return data;
  }
  catch(e){
    print(e.toString());
    return [];
  }
}

Future<void> deleteInterest(String email) async{
  try{    
    
    final querySnapshot = await Interests.where('email', isEqualTo: email).get();
    for (var doc in querySnapshot.docs) {
        await Interests.doc('interest').delete();
      }
    print("***************" "************  deleted" );
  }
  catch(e){
    print(e.toString());
  }
}

Future<void> SavedPost(String email, String image, String title, String time, String description, String url) async{
  try{    
    await posts.doc().set({
      "image": image,
      "title": title,
      "time": time,
      "description": description,
      "email" : email,
      "url": url,
    });
  }
  catch(e){
    print(e.toString());
  }
}

Future<void> delete_save_post(String email, String title) async{
  try{    
    
    final querySnapshot = await posts.where('title', isEqualTo: title).where('email', isEqualTo: email).get();
    for (var doc in querySnapshot.docs) {
        await posts.doc(doc.id).delete();
      }
    print("***************" "************  deleted" );
  }
  catch(e){
    print(e.toString());
  }
}

Future<bool> updateProfile(String old, String email, String password , List<dynamic> interest) async{
  try{
      
      FirebaseAuth.instance.currentUser?.updateEmail(email);
      if (!password.isEmpty){
        FirebaseAuth.instance.currentUser?.updatePassword(password);
      }

      // Future<DocumentSnapshot<Object?>> user =  Interests.doc(old).get();  

      final querySnapshot = await Interests.where('email' , isEqualTo: old).get();
      print(interest);

      for (var doc in querySnapshot.docs) {
        await Interests.doc(doc.id).update({
          'email' : email,
          "interest" :{for (var item  in interest) interest.indexOf(item).toString() : item}
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
}