import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instead_app/pages/searchPage.dart';
import 'package:instead_app/services/database.dart';

class SearchBar extends StatefulWidget {
  final bool read;
  final String userName;
  const SearchBar({Key key, this.read,this.userName}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 16,left: 16,right: 16),
    child: TextField(
      readOnly: widget.read,
        showCursor: false,
        enableInteractiveSelection: true,
        onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
        },
      decoration: InputDecoration(
      hintText: "search..",
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.grey.shade600),
      prefixIcon: Icon(Icons.search,color: Colors.grey.shade600,size: 20,),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.all(8),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.grey.shade100))

    ),
    ),
    );
  }
}
