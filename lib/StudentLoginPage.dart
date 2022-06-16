import "package:flutter/material.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'BookListPage.dart';
import 'dart:convert';


class StudentLoginPage extends StatefulWidget {
 

  @override
  State<StudentLoginPage> createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://i.pinimg.com/564x/c4/0d/cb/c40dcb4b50b3c33df0969c10444b996e.jpg'),
              fit: BoxFit.cover,
            ),
          ),
    child:(Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Student login Page"),
        backgroundColor: Colors.brown,
        elevation:0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label: Text('Admin Login'),
            onPressed: (){
              //route it to the admin page 
              Navigator.pushNamed(context, '/Admin');
            },
          )
        ],
      ),
      
      body: Center(
        child: FloatingActionButton.extended(
          onPressed: (){
            GoogleSignIn().signIn();
            Navigator.pushReplacementNamed(context, '/BookListStudent');
          },
          icon: Icon(Icons.security),
          label: Text('Sign in with Google'),
          backgroundColor: Colors.brown,
          foregroundColor: Colors.black,
        ),
    ),
    )
    
    )
    );
  }
}