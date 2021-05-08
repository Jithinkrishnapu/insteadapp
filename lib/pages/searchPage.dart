import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instead_app/Components/searchbar.dart';
import 'package:instead_app/pages/Chat/chatPageDetail.dart';
import 'package:instead_app/pages/Chat/messagetextbox.dart';
import 'package:instead_app/services/constant.dart';
import 'package:instead_app/services/database.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  QuerySnapshot searchSnapshot;

  DatabaseMethods _databaseMethods = new DatabaseMethods();

  TextEditingController searchTextController = new TextEditingController();
  bool isLoading = false;
  bool haveUserSearched = false;
  initiateSearch()async{
   if(searchTextController.text.isNotEmpty){
     setState(() {
       isLoading = true;
     });
     return await _databaseMethods.getUserByUsername(searchTextController.text).then((val){
       setState(() {
         searchSnapshot = val;
         print("$searchSnapshot");
         setState(() {
           isLoading = false;
           haveUserSearched = true;
           if(searchTextController.text ==Constants.me){
             setState(() {
               isLoading = true;
             });
           }
         });
       });
     });

   }
  }

  sendMessage(String Username){
    List<String> users = [Constants.me,Username];

    String chatRoomId = getChatRoomId(Constants.me,Username);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatRoomId" : chatRoomId,
    };

    _databaseMethods.addChatRoom(chatRoom, chatRoomId);

    Navigator.push(context, MaterialPageRoute(
        builder: (context) => MessageBox(
           chatRoomId,
        )
    ));

  }

  Widget searchList(){
    return haveUserSearched  ? ListView.builder(
      shrinkWrap: true,
      itemCount: searchSnapshot.docs.length,
      itemBuilder: (context,index){
      return SearchTile(userName: searchSnapshot.docs[index].get('name').toString(),
          userEmail:  searchSnapshot.docs[index].get('email').toString());
    }):Container();
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }
  Widget SearchTile({String userName,String userEmail}){
  return  Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(userName),
                Text(userEmail),
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              sendMessage(userName);

            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Message",style: TextStyle(color: Colors.white),)),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children:[ Container(
          child: Row(
            children:[ Expanded(
              child: TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                    hintText: "search..",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade100))
                ),
              ),
            ),
              GestureDetector(
                onTap: (){

                  initiateSearch();
                },
                child: Container(
                  child: Icon(Icons.search),
                ),
              )
          ]),
      ),
          searchList()
    ])
    );
  }
}


