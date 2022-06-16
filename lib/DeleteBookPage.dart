import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";

class DeleteBookPage extends StatefulWidget {
  final String currentTitle;
  final String documentId;
  final String currentAuthor;

  DeleteBookPage({
    required this.currentTitle,
    required this.documentId,
    required this.currentAuthor,

  });

  @override
  State<DeleteBookPage> createState() => _DeleteBookPageState();
}

class _DeleteBookPageState extends State<DeleteBookPage> {

  final FocusNode _titleFocusNode= FocusNode();
  final FocusNode _authorFocusNode=FocusNode();
  bool _isDeleting=false;

static Future<void> deleteItem({
  required String docID
}) async {
  DocumentReference documentReference=FirebaseFirestore.instance.collection("books").doc(docID);
  await documentReference.delete().whenComplete(() => print("note item deleted from the database")).catchError((e)=>print(e));
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: (){
      _titleFocusNode.unfocus();
      _authorFocusNode.unfocus();
    },
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
       title: Text("Delete/Issue Book "),
        backgroundColor: Colors.brown,
        elevation:0.0,
        actions: [
          _isDeleting?Padding(
            padding: const EdgeInsets.only(top:10, bottom: 10, right: 16),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.redAccent
              ),
            ),
            ):IconButton(
              onPressed: ()async{
                setState(() {
                   _isDeleting=true;
                });
                
                 await deleteItem(docID: widget.documentId);
                 setState(() {
                   _isDeleting=false;
                 });
                 Navigator.of(context).pop();

              }, 
              icon: Icon(Icons.delete_forever,color: Colors.redAccent,size: 32),
              )

        ],
    ),
    )
    );
    
  }
}