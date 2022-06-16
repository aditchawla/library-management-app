import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddBook extends StatefulWidget {
  String name;
  String author;

  AddBook(this.name, this.author);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  @override
  Widget build(BuildContext context) {
    CollectionReference books=FirebaseFirestore.instance.collection('books');

    Future<void> addBook(){
      return books
      .add({
           'name': widget.name,
           'author':widget.author, 
          })
          .then((value) => print("Book Added"))
          .catchError((error) => print("Failed to add user: $error"));
  }

  return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://img.freepik.com/free-photo/vintage-grungy-textured-paper-background_53876-103932.jpg?t=st=1655307265~exp=1655307865~hmac=704d8c08a1c9f2c20e48f21f6a93048ea5306cd2f1750cf2948950a0969670e7&w=2000'),
              fit: BoxFit.cover,
            ),
          ),
          
          child:(Scaffold(
            backgroundColor: Colors.transparent,
    appBar: AppBar(
       title: Text("Add Book"),
        backgroundColor: Colors.brown,
        elevation:0.0,
    ),
    body: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          
          child: Column(
          
            children:<Widget>[
              Container(
                padding: const EdgeInsets.all(8),
              width: 300,
                 child: TextField(
                onChanged: (String input){
                   widget.name=input;
                },
                style:
                   TextStyle(color: Colors.black, fontSize: 25),
                    decoration: InputDecoration(
                      hintText: 'Enter book name',
                      hintStyle: TextStyle(
                         color: Colors.black, fontSize: 18.0),
                         
              )
            )
            ),
            Container(
              
              width: 300,
              child: TextField(
                onChanged: (String input){
                 widget.author=input;  
                },
                style:
                   TextStyle(color: Colors.black, fontSize: 25),
                    decoration: InputDecoration(
                      hintText: 'Enter author name',
                      hintStyle: TextStyle(
                         color: Colors.black, fontSize: 18.0),
                         
              )
            )
            ),
            FlatButton(
      onPressed: addBook,
      child: Text(
        "Add Book",
      ),
    ),
            ],
          ),
    ),
  )
          )
  );
}
}