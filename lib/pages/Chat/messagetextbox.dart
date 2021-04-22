import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){

    },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(30),
            ),
              child: Icon(Icons.add,color: Colors.white,size: 20,),
            ),
          ),
          SizedBox(width: 15,),
          Expanded(child: TextField(
            decoration: InputDecoration(
                hintText: "Write message...",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none
            ),
          )),
          SizedBox(width: 15,),
          FloatingActionButton(onPressed:(){
          },
            child: Icon(Icons.send,color: Colors.white,size: 18,),
            backgroundColor: Colors.blue,
            elevation: 0,
          )
        ],
      ),
    );
  }
}
