import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:instead_app/Components/searchbar.dart';
import 'package:instead_app/pages/Chat/unused/ConversationList.dart';
import 'package:instead_app/pages/Chat/unused/chatuserModel.dart';
import 'package:instead_app/pages/searchPage.dart';
import 'package:instead_app/services/constant.dart';
import 'package:instead_app/services/database.dart';
import 'package:instead_app/services/sharepreference.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
DatabaseMethods databaseMethods = new DatabaseMethods();
Stream listStream;

  getUserinfo()async{
    Constants.me = await HelperFunctions.getUserNameSharedPreference();
    databaseMethods.getChatRoom(Constants.me).then((value){
      setState(() {
        listStream=value;
      });
    });
  }

  getList(){
    return StreamBuilder(
      stream: listStream,
      builder: (context,snapshot){
        return snapshot.hasData ? ListView.builder(itemCount:snapshot.data.docs.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return ConversationList(
            name: snapshot.data.docs[index].get("chatRoomId").toString().replaceAll("_", "").replaceAll(Constants.me, ""),
            isMessageRead: (index == 0 || index == 3) ? true : false,
            time: DateTime.now().hour.toStringAsPrecision(4),
            ChatroomId:snapshot.data.docs[index].get("chatRoomId") ,
          );
        },):Container();
      },
    );
  }



@override
  void initState() {
    getUserinfo();

    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SafeArea(
                child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Conversations",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pink[50],
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.pink,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Add New",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            SearchBar(
              read: true,
            ),
            getList(),

            // ListView.builder(
            //   itemCount: chatUsers.length,
            //   shrinkWrap: true,
            //   padding: EdgeInsets.only(top: 16),
            //   physics: NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return ConversationList(
            //       name: chatUsers[index].name,
            //       messageText: chatUsers[index].messageText,
            //       imageUrl: chatUsers[index].imageURL,
            //       time: chatUsers[index].time,
            //       isMessageRead: (index == 0 || index == 3) ? true : false,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}



// class ConversationList extends StatelessWidget {
//   final String name;
//   ConversationList({this.name});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(name),
//     );
//   }
// }
