import 'package:apeye/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  String email;
  SearchField(this.email);
  // const SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState(email);
}


class _SearchFieldState extends State<SearchField> {
  
  String? titel = "";
  String email;

  _SearchFieldState(this.email);
  
  @override
  Widget build(BuildContext context) {
  //   final CollectionReference posts = FirebaseFirestore.instance.collection('SavedPost_test');
  //  final querySnapshot =  posts.where('email', isEqualTo: email).get();
   
    return Scaffold(
      appBar: AppBar(
        title: Card(
          child: TextField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                titel = val;
              });
            },
          ),
        ),
      ),
      
      body: StreamBuilder<QuerySnapshot?>(
        stream: (titel!.isNotEmpty)
           ? FirebaseFirestore.instance
                .collection('SavedPost_test')                
                .where("email" , isEqualTo: email)
                .where("title", isGreaterThanOrEqualTo: titel!)
                .where('title', isLessThan: titel! +'z')
                .snapshots()
            //  :  FirebaseFirestore.instance
            //     .collection('SavedPost_test')                
            //     // .where("email" , isEqualTo: email)
            //     .where("title", isGreaterThanOrEqualTo: titel)
            //     .snapshots(),        
            : FirebaseFirestore.instance
                .collection("SavedPost_test")
                .where("email" , isEqualTo: email)
                .snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index]; 
                    return Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(data['title'],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            // leading: CircleAvatar(
                            //   child: Image.asset(
                            //     "assets/images/search.jpg",
                            //     width: 100,
                            //     height: 50,
                            //     fit: BoxFit.contain,
                            //   ),
                            //   radius: 40,
                            //   backgroundColor: Colors.lightBlue,
                            // ),
                          ),
                          const Divider(
                            thickness: 5,
                          )
                        ],
                      ),
                    );
                  });
        },
      ),
    );
  }
}