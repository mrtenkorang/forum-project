import 'package:flutter/material.dart';
import 'package:knustforum/frontend/widgets/big_text.dart';
import 'package:knustforum/frontend/widgets/custom_vertical_divider.dart';

import '../widgets/chat/chat_bubble.dart';

class DesktopForum extends StatefulWidget {
  final double width;
  const DesktopForum({Key? key, this.width = 0.0}) : super(key: key);

  @override
  State<DesktopForum> createState() => _DesktopForumState();
}

class _DesktopForumState extends State<DesktopForum> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {
      'text': "Hey there!",
      'isMe': false,
      'timestamp': DateTime.now().subtract(const Duration(minutes: 5)),
    },
    {
      'text':
          "Hello! aifsaif sfhisahfis safisa fufsahiusf sahfsashisahfidsa fhfidsh dshfidsf dsuhfids fdsufhidhf idshfidhf dfdfidsafihdsif dsfhdshfdsuhfids dshfuhdsfi dsfdsuhfids fdsuhids dsidshfdshifdh dfdshfdshiuds dsfdhfu ",
      'isMe': true,
      'timestamp': DateTime.now().subtract(const Duration(minutes: 3)),
    },
    // Add more sample messages here
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: widget.width / 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const CustomVerticalDivider(
            height: 500,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                height: 50,
                width: (widget.width / 2) + (widget.width / 5),
                color: Colors.green,
                child: const Center(
                  child: BigText(
                    text: 'Course Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: (widget.width / 2) + (widget.width / 5),
                    height: MediaQuery.of(context).size.height - 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green, // Set the border color here
                        width: 2.0, // Set the border width if desired
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) => ChatBubble(
                        text: messages[index]['text'],
                        isMe: messages[index]['isMe'],
                        timestamp: messages[index]['timestamp'],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Adds a text field and a send button
                  _buildMessageComposer(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Container(
            width: (widget.width / 2),
            child: TextField(
              maxLines: 4,
              controller: _messageController,
              decoration: const InputDecoration.collapsed(
                  hintText: 'Type a message...'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        messages.add({
          'text': messageText,
          'isMe': true,
          'timestamp': DateTime.now(),
        });
        _messageController.clear();
      });
    }
  }
}
