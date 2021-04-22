

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instead_app/pages/home.dart';
import 'package:instead_app/userspart/signUppage.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
         Scaffold(
          backgroundColor: Colors.grey[300],
            appBar: AppBar(
              title: Text('Log In'),
              centerTitle: true,
              backgroundColor: Colors.blue,
              elevation: 10,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          onTap: () {
                            print("tap Happened");
                          },
                          validator: (input) {
                            if (input.isEmpty) {
                              return ("Email is not entered");
                            }
                          },
                          onSaved: (input) => _email = input,
                          decoration: InputDecoration(
                            hoverColor: Colors.white,
                            hintText: "write your Username",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: "username",
                          ),
                        ),
                      ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            onTap: () {
                              print("tap Happened");
                            },
                            validator: (input) {
                              if (input.length < 6) {
                                return ("Your password need atleast 6 characters");
                              }
                            },
                            onSaved: (input) => _password = input,
                            decoration: InputDecoration(
                              hintText: "write your Password",
                              border: OutlineInputBorder(
                              ),
                              labelText: "password",
                            ),
                            obscureText: true,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            print("forgot password");
                          },
                          child: Text("forgot password?"),
                          textColor: Colors.blue[700],
                        ),
                        FlatButton(
                          onPressed: () {
                            signIn();
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.blue,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Does not have account?'),
                                SizedBox(
                                  height: 20,
                                ),
                                FlatButton(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  textColor: Colors.white,
                                  color: Colors.greenAccent[400],
                                  child: Text(
                                    'Create New Account',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignUpPage()),
                                    );
                                  },
                                ),
                                SizedBox(height: 20,)
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ))
                      ],
                    ),
                  ),

              ),
            ));
  }

  Future<void> signIn() async {
    final formState = formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseAuthException catch (e) {
        print(e.message);
      }
      //to do login to firebase
    }
  }
}


