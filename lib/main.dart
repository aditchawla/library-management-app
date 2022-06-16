import 'package:flutter/material.dart';

import 'package:library_management_app/AdminHomeScreen.dart';
import 'package:library_management_app/AdminLoginPage.dart';
import 'package:library_management_app/BookListPage.dart';
import 'package:library_management_app/DeleteBookPage.dart';
import 'StudentLoginPage.dart';
import 'AdminLoginPage.dart';
import 'AddBook.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
    initialRoute: '/Student',
    routes: {
      '/Student':(context)=>StudentLoginPage(),
      '/Admin':(context) => AdminLoginPage('',''),
      '/BookListStudent':(context) => BookListPage(),
      '/AdminHomeScreen':(context) => AdminHomeScreen(),
      '/AddBookPage':(context) => AddBook('',''),
      '/DeleteBookPage':(context) => DeleteBookPage(currentTitle: '', documentId: '', currentAuthor: '' ),
    },
    );
  }
}

