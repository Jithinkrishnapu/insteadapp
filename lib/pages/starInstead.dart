import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:instead_app/pages/insteadLogin.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blue,
            body: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(vertical: 30),
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Welcome to Instead App",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Instead is a Social Networking application ,here you can chat with your Friends,let's try our InsteadApp",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40, right: 10),
                    child: Image.asset(
                      "assets/logo.png",
                      scale: 3,
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text("Get Started"),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
            )
        )
    );
  }
}
