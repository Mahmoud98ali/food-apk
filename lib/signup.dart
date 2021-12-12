// ignore_for_file: missing_return, duplicate_ignore

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cor/home/homepage.dart';
import 'package:flutter_cor/providers/user_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    String myusername , mypassword, myemail ;



  singUp() async {
    var formdata = formstate.currentState;
    if (formdata.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: myemail,
            password: mypassword,

        );

        return userCredential ;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(context: context,title: "Error",body:Text("The password provided is too weak."))..show();

        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(context: context,title: "Error",body:Text("The account already exists for that email."))..show();
        }


      } catch (e) {
        print(e);
      }
    } else {
      print("Not Valid");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
            height: 225,
            width: 225,
            child: Center(child: Image.asset("images/4.png"))),
        Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formstate,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (val){
                    myusername = val ;
                  },
                  validator: (val) {
                    // ignore: missing_return, missing_return
                    if (val.length > 100) {
                      return "username can't to be larger than 100 letter ";
                    }
                    if (val.length < 2) {
                      return "username can't to be less than 2 letter ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "username",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onSaved: (val){
                    myemail = val ;
                  },
                  // ignore: duplicate_ignore
                  validator: (val) {
                    // ignore: missing_return, missing_return
                    if (val.length > 100) {
                      return "username can't to be larger than 100 letter ";
                    }
                    if (val.length < 4) {
                      return "username can't to be less than 4 letter ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "email",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onSaved: (val){
                    mypassword = val ;
                  },
                  validator: (val) {
                    // ignore: missing_return, missing_return
                    if (val.length > 100) {
                      return "username can't to be larger than 100 letter ";
                    }
                    if (val.length < 4) {
                      return "username can't to be less than 4 letter ";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.star),
                      hintText: "password",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text("if you have ِِِAccount "),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("login");
                          },
                          child: Text(
                            "click here",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    child: Text(
                      "Sing Up ",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onPressed: () async {
                      UserCredential response = await singUp();
                      if(response != null ){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
                      }else {
                        print("==========================");
                        print("Sing Up Failed");
                        print("==========================");
                      }
                      ;

                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
