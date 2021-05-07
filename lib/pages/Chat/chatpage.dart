import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:instead_app/Components/searchbar.dart';
import 'package:instead_app/pages/Chat/ConversationList.dart';
import 'package:instead_app/pages/Chat/chatuserModel.dart';
import 'package:instead_app/pages/searchPage.dart';
import 'package:instead_app/services/constant.dart';
import 'package:instead_app/services/sharepreference.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Mohanlal",
        messageText: "messageText",
        imageURL:
            "https://pbs.twimg.com/profile_images/888341377729273856/OJGYfJTs_400x400.jpg",
        time: "4:10"),
    ChatUsers(
        name: "Mammutty",
        messageText: "messageText",
        imageURL:
            "https://pbs.twimg.com/media/EfkEgPgUMAAGvJq?format=jpg&name=small",
        time: "time"),
    ChatUsers(
        name: "SureshGopi",
        messageText: "messageText",
        imageURL:
            "https://static.toiimg.com/photo/msid-81564322/81564322.jpg?85264",
        time: "4:20"),
    ChatUsers(
        name: "Manicheattan",
        messageText: "messageText",
        imageURL:"https://pbs.twimg.com/media/C1AFNK3WEAA2yhk?format=jpg&name=large",
        time: "1:20"),
    ChatUsers(
        name: "Mukesh",
        messageText: "messageText",
        imageURL:
            "https://s3images.zee5.com/wp-content/uploads/sites/7/2020/09/actormukeshmadhavan_74525286_2975838839097618_2566965010666507161_n-1.jpg",
        time: "2:10"),
    ChatUsers(
        name: "Jagathy",
        messageText: "messageText",
        imageURL:
            "https://resize.indiatvnews.com/en/resize/oldbucket/715_-/entertainmentbollywood/Sreekumar_To_Un3839.jpg",
        time: "10:10"),
    ChatUsers(
        name: "Prithviraj",
        messageText: "messageText",
        imageURL:
            "https://st1.bollywoodlife.com/wp-content/uploads/2020/05/Prithviraj-Sukumaran.jpg",
        time: "9:10"),
    ChatUsers(
        name: "Tovino",
        messageText: "messageText",
        imageURL:
            "https://1847884116.rsc.cdn77.org/tamil/home/tovino_thomas7102020m.jpg",
        time: "3:20"),
    ChatUsers(
        name: "Nivin",
        messageText: "messageText",
        imageURL:
            "https://i0.wp.com/www.newsgram.com/wp-content/uploads/2018/01/C3eOndKVYAAKAyp.jpg",
        time: "2:20")
  ];


  getUserinfo()async{
    Constants.me = await HelperFunctions.getUserNameSharedPreference();
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
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3) ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
