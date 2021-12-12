import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cor/home/homepage.dart';
import 'package:flutter_cor/providers/user_provider.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  String mypassword, myemail;

  UserProvider userProvider;

  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);
      userProvider.addUserData(
        currentUser: user,
        userEmail: user.email,
        userImage: user.photoURL,
        userName: user.displayName,
      );

      return user;
    } catch (e) {
      print(e.message);
    }
  }


  signin() async {
    var formdata = formstate.currentState;
    if (formdata.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("No user found for that email."))
            ..show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text("Wrong password provided for that user."))
            ..show();
        }
      }
    } else {
      print("Not Valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider =Provider.of<UserProvider>(context);
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
            height: 225,
            width: 225,
            child: Center(child: Image.asset("images/main.png"))),
        Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formstate,
            child: Column(
              children: [

                SignInButton(
                  Buttons.Google,elevation: 5,
                  text: "Sign in with Google",
                  onPressed: () {
                    _googleSignUp().then((value) => Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context)=>HomePage())));
                  },
                ),
                SizedBox(height: 10,),
                Text("OR",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextFormField(
                  onSaved: (val) {
                    myemail = val;
                  },
                  // ignore: duplicate_ignore
                  validator: (val) {
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
                      hintText: "Email",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onSaved: (val) {
                    mypassword = val;
                  },
                  validator: (val) {
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
                      Text("if you have not account "),
                      InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed("signup");
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
                      "Sing In",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onPressed: () async {
                      var user = await signin();
                      if (user != null) {
                        Navigator.of(context).pushReplacementNamed("homepage");
                      }
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
