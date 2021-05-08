import 'package:flutter/material.dart';
import 'package:instead_app/pages/Chat/chatPageDetail.dart';
import 'package:instead_app/services/constant.dart';
import 'package:instead_app/services/database.dart';

class MessageBox extends StatefulWidget {
  final String chatRoomId;
  MessageBox(this.chatRoomId);
  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController messagecontroller = TextEditingController();
  Stream chatStream;
  chatMessage(){
    return StreamBuilder(
      stream: chatStream,
      builder: (context, snapshot){
        return snapshot.hasData ?ListView.builder(itemCount: snapshot.data.docs.length,
          itemBuilder: (context,index){
            return MessageTile(message: snapshot.data.docs[index].get('message'),
            isSendByMe:snapshot.data.docs[index].get('sendBy') == Constants.me );
          },):Container();
      },
    );

  }

  sendMessage() {
    if (messagecontroller.text.isNotEmpty) {
      Map<String, String> messageMap = {
        "message": messagecontroller.text,
        "sendBy": Constants.me,
        "time":DateTime.now().millisecondsSinceEpoch.toString()
      };
      databaseMethods.addConversationMessage(widget.chatRoomId, messageMap);
      messagecontroller.text = "";
    }
  }

  Widget messageBoX() {
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: TextField(
            controller: messagecontroller,
            decoration: InputDecoration(
                hintText: "Write message...",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none),
          )),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              sendMessage();
            },
            child: Icon(
              Icons.send,
              color: Colors.white,
              size: 18,
            ),
            backgroundColor: Colors.blue,
            elevation: 0,
          )
        ],
      ),
    );
  }
  @override
  void initState() {
    databaseMethods.getMessage(widget.chatRoomId).then((value){
      setState(() {
        chatStream = value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/736x/8f/24/b1/8f24b1575966f63608f752a0c95b4bf6.jpg"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Online",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                  ],
                )),
                Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          chatMessage(),
          Align(alignment: Alignment.bottomLeft, child: messageBoX())],
      ),
    );
  }
}
