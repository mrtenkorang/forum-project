import 'package:flutter/material.dart';
import 'package:knustforum/backend/models/message_model.dart';
import 'package:knustforum/database/all_messages.dart';
import 'package:knustforum/frontend/widgets/big_text.dart';
import 'package:provider/provider.dart';

import '../../backend/models/users_model.dart';
import '../widgets/chat/chat_bubble.dart';
import '../widgets/small_text.dart';

class MobileForum extends StatefulWidget {
  final double width;
  const MobileForum({Key? key, this.width = 0.0}) : super(key: key);

  @override
  State<MobileForum> createState() => _MobileForumState();
}

class _MobileForumState extends State<MobileForum> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                  width: widget.width,
                  child: const Center(
                    child: BigText(text: 'Discussion Forum'),
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
                      child: StreamBuilder<Iterable<MessageModel>>(
                          stream: AllMessageDB().getAllMessages,
                          initialData: null,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
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
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () async {
                              String messageText =
                                  _messageController.text.trim();

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
          ],
        ),
      ),
    );
  }
}
