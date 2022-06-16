// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:library_management_app/DeleteBookPage.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://img.freepik.com/free-photo/wooden-table_36051-46.jpg?w=2000'),
              fit: BoxFit.cover,
            ),
          ),
    
    
    child:(Scaffold( 
      backgroundColor: Colors.transparent ,
       appBar:AppBar(
       title: Text("Admin Home Page"),
        backgroundColor: Colors.brown,
        elevation:0.0,
        actions: <Widget>[
          FlatButton.icon(       //convert the add book icon to a floating action button with a drop down menu
            icon:Icon(Icons.book),
            label: Text('Add book'),
            onPressed: (){
              //route it to the add book page 
              Navigator.pushNamed(context, '/AddBookPage');
            },
          ),
          
        ],
    ),
    body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("books").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
             if(!streamSnapshot.hasData){
               return Center(child: CircularProgressIndicator());
             }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot books = streamSnapshot.data!.docs[index];
              return Card(
                child: ListTile(
                  title: Text("${books['name']}"),
                               onTap: () => Navigator.of(context).push(
                                 MaterialPageRoute(
                                   builder: (context) => DeleteBookPage(
                                    currentTitle:books['name'],
                                    currentAuthor:books['author'],
                                    //currentIssueStatus:books['status']
                                    documentId: streamSnapshot.data!.docs[index].id,
                                   )
                                  )
                               ),
                               
                               /*async => await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
    await myTransaction.delete(streamSnapshot.data!.docs[index].reference);
}),*/
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${books['author']}"),
                      //Text(books['genre']),
                      //Text(books['isbn']),
                    ],
                  ),
                  //trailing: Text(books['publisher']),
                ),
              );
            },
          ),
      );
          },
        ),
    )
    )
    ); 
  }
}