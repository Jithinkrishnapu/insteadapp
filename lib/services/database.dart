

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  uploadUserInfo(userMap){
FirebaseFirestore.instance.collection("users").add(userMap);
  }

  getUserByUsername(String userName)async{
   return FirebaseFirestore.instance.collection("users").where("name",isEqualTo: userName).get();

  }
 
  getUserByEmail(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }
  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }
  addConversationMessage(String chatRoomId,messageMap){
   FirebaseFirestore.instance.collection("chatRoom").doc(chatRoomId).collection("chats").add(messageMap).catchError((e){
      print(e.toString());
    }
    );
  }

  getMessage(String chatRoomId)async{
   return await FirebaseFirestore.instance.collection("chatRoom").doc(chatRoomId).collection("chats").orderBy("time",descending: false).snapshots();
  }

  getChatRoom(String userName)async{
    return await FirebaseFirestore.instance.collection("chatRoom").where("users",arrayContains: userName).snapshots();

  }
  
}