import 'package:flutter/material.dart';
import '../models/channel.dart';
import 'message_screen.dart';

class ChannelListScreen extends StatefulWidget {
  const ChannelListScreen({super.key});

  @override
  State<ChannelListScreen> createState() => _ChannelListScreenState();
}

class _ChannelListScreenState extends State<ChannelListScreen> {

  int selectedIndex = -1;

  final List<Channel> items = [
    Channel(
      title: "general",
      unread: 1,
      chats: ["Hi everyone"],
    ),
    Channel(
      title: "design",
      unread: 1,
      chats: ["New files uploaded"],
    ),
    Channel(
      title: "flutter",
      unread: 1,
      chats: ["State"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Channels")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final channel = items[index];

          return ListTile(
            selected: selectedIndex == index,
            title: Text("# ${channel.title}"),
            trailing: channel.unread > 0
                ? CircleAvatar(
                    radius: 12,
                    child: Text(
                      channel.unread.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  )
                : null,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      MessageScreen(messages: channel.chats),
                ),
              );
            },
          );
        },
      ),
    );
  }
}