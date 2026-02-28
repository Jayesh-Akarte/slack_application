import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final List messages;

  const MessageScreen({super.key, required this.messages});

  @override
 
  
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

  TextEditingController messageController = TextEditingController();

  List localMessages = []; 

  @override
  void initState() {
    super.initState();

    // Copy initial messages
    localMessages = List.from(widget.messages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: Column(
        children: [

          // Message List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: localMessages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      localMessages[index].toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                );
              },
            ),
          ),

          // Message Input Section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String text = messageController.text.trim();

                    if (text.isEmpty) {
                      return;
                    }
                    print("Message typed: $text"); 
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}