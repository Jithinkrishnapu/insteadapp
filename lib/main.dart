import 'package:flutter/material.dart';
import 'package:instead_app/runinsteadapp.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseApp = await Firebase.initializeApp();
  runApp(InsteadApp());
}