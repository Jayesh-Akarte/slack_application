import 'package:flutter/material.dart';
import 'message_screen.dart';

class ChannelScreen extends StatefulWidget {
  const ChannelScreen({super.key});

  @override
 
  _ChannelScreenState createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {

  int selected = -1;

  List<Map<String, dynamic>> channels = [
    {
      "name": "general",
      "unread": 2,
      "messages": ["Hello", "Welcome to general"]
    },
    {
      "name": "random",
      "unread": 1,
      "messages": ["Random chat message"]
    },
    {
      "name": "flutter",
      "unread": 0,
      "messages": ["Flutter discussion here"]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Channels"),
      ),
      body: ListView.builder(
        itemCount: channels.length,
        itemBuilder: (context, index) {

          var item = channels[index];

          return ListTile(
            selected: selected == index,
            title: Text("# " + item["name"]),
            trailing: item["unread"] > 0
                ? CircleAvatar(
                    radius: 12,
                    child: Text(
                      item["unread"].toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                : null,
            onTap: () {
              setState(() {
                selected = index;
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessageScreen(
                    messages: item["messages"],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}