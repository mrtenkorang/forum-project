import 'package:flutter/material.dart';
import 'package:knustforum/backend/models/message_model.dart';
import 'package:knustforum/database/all_messages.dart';
import 'package:knustforum/frontend/widgets/big_text.dart';
import 'package:provider/provider.dart';

import '../../backend/models/users_model.dart';
import '../widgets/chat/chat_bubble.dart';
import '../widgets/small_text.dart';

class DesktopForum extends StatefulWidget {
  final double width;
  const DesktopForum({Key? key, this.width = 0.0}) : super(key: key);

  @override
  State<DesktopForum> createState() => _DesktopForumState();
}

class _DesktopForumState extends State<DesktopForum> {
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: widget.width,
            child: const Center(
              child: BigText(
                text: 'Discussion Forum',
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
                width: widget.width,
                height: MediaQuery.of(context).size.height - 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green, // Set the border color here
                    width: 2.0, // Set the border width if desired
                  ),
                ),
                child: StreamBuilder<Iterable<MessageModel>>(
                    stream: AllMessageDB().getAllMessages,
                    initialData: null,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: 30,
                          width: 30,
                          child: const CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      } else if (snapshot.hasData) {
                        print('${snapshot.data?.length} snapshot');
                        final List<MessageModel> messages = [];
                        final allMessages = snapshot.data!;
                        for (var message in allMessages) {
                          if (message.message == "") {
                            continue;
                          }
                          messages.add(message);
                          print(messages.first);
                        }
                        return ListView.builder(
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (context, index) => ChatBubble(
                            text: messages[index].message,
                            userEmail: messages[index].userEmail,
                            isMe: messages[index].userEmail,
                            timestamp: messages[index].time.toDate(),
                          ),
                        );
                      } else {
                        print('${snapshot.stackTrace}');
                        return const SizedBox(
                          height: 100,
                          width: 300,
                          child: Center(
                            child: AppSmallText(
                              text: 'No questions yet',
                              size: 20,
                              color: Colors.green,
                            ),
                          ),
                        );
                      }
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              // Adds a text field and a send button
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: (widget.width / 2),
                      child: TextField(
                        maxLines: 4,
                        controller: _messageController,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Ask a question...',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        size: 30,
                        color: Colors.green,
                      ),
                      onPressed: () async {
                        String messageText = _messageController.text.trim();

                        if (messageText.isNotEmpty) {
                          //Timestamp timeStamp = Timestamp.now();
                          await AllMessageDB().saveMessage(
                              messageText, DateTime.now(), user.email);
                          setState(() {
                            _messageController.clear();
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
