
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();
}


class _BookListPageState extends State<BookListPage> {

   bool _value = false;
@override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://img.freepik.com/free-vector/white-gold-geometric-pattern-background-vector_53876-140726.jpg?t=st=1655307265~exp=1655307865~hmac=6aa4e56edcd4c965874c4b45c751aab56b2a637b32e875e1386d22afafc9de17&w=1800'),
              fit: BoxFit.cover,
            ),
          ),
          
          
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Inventory Page"),
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
                child: 
                
                CheckboxListTile(
                  title: Text("${books['name']}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${books['author']}"),
                      //Text(books['genre']),
                      //Text(books['isbn']),
                    ],
                  ),
                  
                  autofocus: false,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  selected: _value,
                  value: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                ), 
                
                
                
                
                
                
                
                /*ListTile(
                  title: Text("${books['name']}"),
     

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
                ),*/
              );
            },
          ),
      );
          },
        ),
      ),
    );
  }
}
// ignore: non_constant_identifier_names
/*Widget build_List_Item(BuildContext context, DocumentSnapshot document){
  //DocumentSnapshot books= snapshot.data.documents[index];
              return Card(
                child: ListTile(
                  title: Text(document['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(document['author']),
                      //Text(books('issued')) if we need to add the issued part to the books
                    ],
                  ),

                ),
              );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
         "BookList"),
         backgroundColor: Colors.brown,
        elevation:0.0,
        
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("books").snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
      
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: snapshot.data!.documents.length,
              itemBuilder: (context, index) => build_List_Item(context, snapshot.data.documents[index])
              /*DocumentSnapshot books= snapshot.data.documents[index];
              return Card(
                child: ListTile(
                  title: Text(books['name']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(books['author']),
                      //Text(books('issued')) if we need to add the issued part to the books
                    ],
                  ),

                ),
              );*/
              
              
            ) 
          );
        },

      ),
    );
    
  }
}*/