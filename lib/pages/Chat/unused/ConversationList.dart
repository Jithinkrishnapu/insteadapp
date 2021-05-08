import 'package:flutter/material.dart';
import 'package:instead_app/pages/Chat/chatPageDetail.dart';
import 'package:instead_app/pages/Chat/messagetextbox.dart';

class ConversationList extends StatefulWidget {
  String name;
  String ChatroomId;
  String time;
  bool isMessageRead;
  ConversationList({this.name, this.ChatroomId, this.isMessageRead,this.time});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageBox(widget.ChatroomId)));
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
            child: Row(
              children: [
                Expanded(child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.account_circle,size: 40,
                      color: Colors.blue,
                      ),
                    ),
                    // CircleAvatar(
                    //   backgroundImage: NetworkImage(widget.imageUrl),
                    //   maxRadius: 30,
                    // ),
                    SizedBox(width: 16,),
                    Expanded(child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name,style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          // Text(widget.messageText,style: TextStyle(
                          //   fontSize: 13,color: Colors.grey.shade600,fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
                          // Divider(thickness: 1,color: Colors.black12,)
                        ],
                      ),
                    ))

                  ],
                )),
                Text(widget.time,style: TextStyle(fontSize: 12,fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),)
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.shade100,
          )
        ],
      )

    );
  }
}
