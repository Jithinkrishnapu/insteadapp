import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instead_app/pages/Chat/chatMessagemodel.dart';
import 'package:instead_app/pages/Chat/messagetextbox.dart';
import 'package:instead_app/services/database.dart';
//
// class ChatDetailPage extends StatefulWidget{
//   final String ChatRoomId;
//   ChatDetailPage({this.ChatRoomId});
//   @override
//   _ChatDetailPageState createState() => _ChatDetailPageState();
// }
//
// class _ChatDetailPageState extends State<ChatDetailPage> {
//   DatabaseMethods databaseMethods = new DatabaseMethods();
//   Stream chatStream;
//   chatMessage(){
//     return StreamBuilder<QuerySnapshot>(
//       stream: chatStream,
//       builder: (context, snapshot){
//         return ListView.builder(itemCount: snapshot.data.docs.length,
//           itemBuilder: (context,index){
//             return MessageTile(message: snapshot.data.docs[index]["message"].get());
//           },);
//       },
//     );
//
//   }
//   // List<ChatMessage> messages = [
//   //   ChatMessage(messageContent: "Hello, Jithin", messageType: "receiver"),
//   //   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
//   //   ChatMessage(messageContent: "Hey Laletta, I am doing fine dude. wbu?", messageType: "sender"),
//   //   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
//   //   ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
//   // ];
//   @override
//   void initState() {
//     databaseMethods.getMessage(widget.ChatRoomId).then((value){
//       setState(() {
//         chatStream = value;
//       });
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           flexibleSpace: SafeArea(
//             child: Container(
//               padding: EdgeInsets.only(right: 16),
//               child: Row(
//                 children: [
//                   IconButton(onPressed: (){
//                     Navigator.pop(context);
//                   }, icon:Icon(Icons.arrow_back_ios,color: Colors.black,)),
//                   SizedBox(width: 2,),
//                   CircleAvatar(
//                     backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/888341377729273856/OJGYfJTs_400x400.jpg"),
//                     maxRadius: 20,
//                   ),
//                   SizedBox(
//                     width: 12,
//                   ),
//                   Expanded(child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Mohanlal",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
//                       SizedBox(height: 6,),
//                       Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
//                     ],
//                   )),
//                   Icon(Icons.settings,color: Colors.black,),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       body: Stack (
//         children: [
//           chatMessage(),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: MessageBox(widget.ChatRoomId),
//           )
//         ],
//       ) ,
//     );
//   }
// }

 class MessageTile extends StatelessWidget {
final String message;
final bool isSendByMe;
MessageTile({this.message,this.isSendByMe});
@override
   Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.only(left: isSendByMe?0:24,right: isSendByMe?24:0),
       margin: EdgeInsets.symmetric(vertical: 8),
       width: MediaQuery
           .of(context)
           .size
           .width,
       alignment:isSendByMe? Alignment.centerRight:Alignment.centerLeft ,
       child: Container(
         decoration: BoxDecoration(
             borderRadius: isSendByMe?BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(23),
             ):BorderRadius.only(
               topLeft: Radius.circular(23),
               topRight: Radius.circular(23),
               bottomRight: Radius.circular(23),
             ),
             color: (isSendByMe?Colors.grey.shade200:
                 // "messages[index].messageType=="receiver"?"
                 Colors.blue)
           // :Colors.blue[200])
         ),
         padding: EdgeInsets.all(16),
         child: Text(message, style: TextStyle(fontSize: 15),),
       ),
     );
   }
 }

