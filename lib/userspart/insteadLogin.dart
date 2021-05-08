import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instead_app/pages/home.dart';
import 'package:instead_app/services/database.dart';
import 'package:instead_app/services/sharepreference.dart';
import 'package:instead_app/userspart/signUppage.dart';

class LoginPage extends StatefulWidget {
  final Function toggle;
  LoginPage(this.toggle);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  String _email, _password;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  bool isLoading = false;

  signIn() async {
    if (formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await
          FirebaseAuth.instance.signInWithEmailAndPassword(
         email: emailEditingController.text, password:passwordEditingController.text)
          .then((result) async {
        if (result != null)  {
          QuerySnapshot userInfoSnapshot =
          await DatabaseMethods().getUserByEmail(emailEditingController.text);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.docs[0].get("name"));
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.docs[0].get("email"));

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Log In'),
          centerTitle: true,
          automaticallyImplyLeading: false,
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
                      controller: emailEditingController,
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
                        labelText: "email",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: passwordEditingController,
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
                        border: OutlineInputBorder(),
                        labelText: "password",
                        suffixIcon: IconButton(
                          onPressed: _toggle,
                          icon: _obscureText ?Icon(Icons.remove_red_eye,color: Colors.blue,):Icon(Icons.remove_red_eye,color: Colors.black,),
                        )
                      ),
                      obscureText: _obscureText,
                    ),
                  ),
                  // FlatButton(onPressed:_toggle,
                  // child: Text(_obscureText?"show":"Hide"),),
                  TextButton(
                    onPressed: () {

                      print("forgot password");
                    },
                    child: Text("forgot password?"),
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
                          GestureDetector(
                            onTap: () {
                              widget.toggle;
                            },
                            child: FlatButton(
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
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignUpPage(widget.toggle)),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  // Future<void> signIn() async {
  //
  //
    // final formState = formkey.currentState;
    // if (formState.validate()) {
    //   formState.save();
    //   try {
    //     UserCredential user = await FirebaseAuth.instance
    //         .signInWithEmailAndPassword(email: _email, password: _password);
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => HomePage()));
    //   } on FirebaseAuthException catch (e) {
    //     print(e.message);
    //   }
    //   //to do login to firebase
    // }
  }

