
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:library_management_app/StudentLoginPage.dart';
import 'StudentLoginPage.dart';



class AdminLoginPage extends StatefulWidget {

  String username;
  String password;

  AdminLoginPage(this.username, this.password);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  


// ignore: non_constant_identifier_names
/*Future<http.Response> AdminLogin(String username, String password){
  return http.post(
    Uri.parse('https://sids438.pythonanywhere.com/login/'),
     headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
     },
      body: jsonEncode(<String, String>{
      'username':username,
      'password':password
    }), 
  );
}*/
String result='';


Future<String> makePostRequest() async {
  final url = Uri.parse('https://sids438.pythonanywhere.com/login/');
  final headers = {"Content-type": "application/json"};
  final json = '{"username": "${widget.username}", "password": "${widget.password}"}';
  final response = await post(url, headers: headers, body: json);
  //print('Status code: ${response.statusCode}');
  //print('Body: ${response.body}');
  result="${response.body}";
  return '${response.body}';
}


  @override
  Widget build(BuildContext context) {
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
      title: Text("Admin Login Page"),
      backgroundColor:  Colors.brown,
      elevation:0.0,
      actions: <Widget>[
         /* FlatButton.icon(
            icon:Icon(Icons.person),
            label: Text('Student Login'),
            onPressed: (){
              //route it to the student login page
             
            },
          )*/
      ]

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
                   widget.username=input;
                },
                style:
                   TextStyle(color: Colors.black, fontSize: 25),
                    decoration: InputDecoration(
                      hintText: 'Enter Username',
                      hintStyle: TextStyle(
                         color: Colors.black, fontSize: 18.0),
                         
              )
            )
            ),
            Container(
              
              width: 300,
              child: TextField(
                obscureText:true,
                onChanged: (String input){
                    widget.password=input;
                    
                },
                style:
                   TextStyle(color: Colors.black, fontSize: 25),
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                         color: Colors.black, fontSize: 18.0),
                         
              )
            )
            ),
            FlatButton(
              color:  Colors.pink[400],
              child: Text(
                'Sign In',
                style: TextStyle(color:Colors.black),
              ),
              onPressed: (){

                makePostRequest();
                print(result);
                // ignore: unrelated_type_equality_checks
                //AdminLogin(widget.username,widget.password)=='Logged In'
                String keys='"Logged In"';
              
                if(result==keys){
                  Navigator.pushReplacementNamed(context, '/AdminHomeScreen');
                }
                else{
                  print("the username or password is incorrect");
                  child:Column(
                    children: [
                      Text(
                        "the username or password is incorrect, try again",//update the ui -watch flutter net ninjas for this
                        style:TextStyle(color: Colors.red, fontSize: 25)
                      )
                    ],

                  );
                }

                const CircularProgressIndicator();
                
              },
            )
            
            ],
            
          )
          )
          )
    ),
    );
   
    
    
  }
}