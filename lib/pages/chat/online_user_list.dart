import 'package:flutter/material.dart';
import 'package:hello_world/models/online_user.dart';
import 'package:hello_world/pages/chat/online_user.dart';

class OnlineUsersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _OnlineUsersPageState();
  }
}

class _OnlineUsersPageState extends State<OnlineUsersPage> {
  List<OnlineUserModel> onlineUsers = new List<OnlineUserModel>();

  @override
  void initState() {
    setState(() {
      onlineUsers = onlineUsersData.map((onlineUserData) {
        return OnlineUserModel.fromJson(onlineUserData);
      }).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: onlineUsers.length,
      itemBuilder: (context, int index) {
        return new OnlineUserWidget(onlineUser: onlineUsers.elementAt(index));
      },
    ));
  }

  final onlineUsersData = [
    {
      "id": "1",
      "email": "ogoma.emmanuel@gmail.com",
      "imageUrl":
          "https://media.licdn.com/dms/image/C5603AQEO-nI8cnK_xw/profile-displayphoto-shrink_800_800/0?e=1553731200&v=beta&t=8AnOF1lW9zzdRMfDIpBGkMPT_E1Pd9wTsay9Rd-UcIg",
      "firstName": "Emmanuel",
      "lastName": "Ogoma",
      "userName": "Test"
    },
    {
      "id": "2",
      "email": "emmanuel@gmail.com",
      "imageUrl":
          "https://media.licdn.com/dms/image/C5603AQEO-nI8cnK_xw/profile-displayphoto-shrink_800_800/0?e=1553731200&v=beta&t=8AnOF1lW9zzdRMfDIpBGkMPT_E1Pd9wTsay9Rd-UcIg",
      "firstName": "Steve",
      "lastName": "Opiyo",
      "userName": "Test"
    },
    {
      "id": "3",
      "email": "ogoma@gmail.com",
      "imageUrl":
          "https://media.licdn.com/dms/image/C5603AQEO-nI8cnK_xw/profile-displayphoto-shrink_800_800/0?e=1553731200&v=beta&t=8AnOF1lW9zzdRMfDIpBGkMPT_E1Pd9wTsay9Rd-UcIg",
      "firstName": "Brian",
      "lastName": "Kimtai",
      "userName": "Test"
    },
    {
      "id": "4",
      "email": "ogomaemmanuel@gmail.com",
      "imageUrl":
          "https://media.licdn.com/dms/image/C5603AQEO-nI8cnK_xw/profile-displayphoto-shrink_800_800/0?e=1553731200&v=beta&t=8AnOF1lW9zzdRMfDIpBGkMPT_E1Pd9wTsay9Rd-UcIg",
      "firstName": "Caren",
      "lastName": "Akoth",
      "userName": "Test"
    },
  ];
}
