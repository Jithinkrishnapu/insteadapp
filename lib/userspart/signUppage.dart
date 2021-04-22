import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:instead_app/pages/home.dart';
import 'package:instead_app/userspart/insteadLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instead_app/services/seviceAuth.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthenticationService _auth = AuthenticationService();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  Widget components(
      {void Function() press,
      String name,
      Color textcolor,
      Color buttoncolor}) {
    return FlatButton(
      onPressed: press,
      child: Text(
        name,
        style: TextStyle(
          color: textcolor,
        ),
      ),
      color: buttoncolor,
    );
  }

  Widget gap() {
    return SizedBox(
      height: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 5,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _namecontroller,
                      keyboardType: TextInputType.text,
                      onTap: () {
                        print("tap Happened");
                      },
                      validator: (input){
                        if(input.isEmpty){
                          return ("feild is empty");
                        }
                      },
                      decoration: InputDecoration(
                        hoverColor: Colors.white,
                        hintText: "write your Username",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "username",
                      ),
                    ),
                  ),
                  gap(),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _emailcontroller,
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
                        hintText: "write your Email",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "Email",
                      ),
                    ),
                  ),
                  gap(),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _passcontroller,
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
                      ),
                      obscureText: true,
                    ),
                  ),
                  gap(),
                  components(
                      press: () {
                        if (_formkey.currentState.validate()) {
                          Createuser();
                        }
                      },
                      name: "Sign Up",
                      textcolor: Colors.white,
                      buttoncolor: Colors.blue),
                  gap(),
                  Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text('Does already have an account?'),
                          SizedBox(
                            height: 20,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            textColor: Colors.white,
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          )),
    );
  }

  void Createuser()async {
    dynamic result =await _auth.CreateNewUser(_emailcontroller.text, _passcontroller.text);
    if (result==null){
      print("email is not valid");
  }else {
      print(result.toString());
      _namecontroller.clear();
      _emailcontroller.clear();
      _passcontroller.clear();
      Navigator.pop(context);
    }

      }
    }

