import 'package:flutter/material.dart';
import 'package:knustforum/frontend/widgets/small_text.dart';
import 'package:provider/provider.dart';

import '../../../backend/models/users_model.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final String isMe;
  final String userEmail;
  final DateTime timestamp;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.timestamp,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    final alignment =
        isMe == user.email ? Alignment.centerRight : Alignment.centerLeft;
    final bubbleColor = isMe == user.email ? Colors.green : Colors.grey[300];

    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSmallText(
              text: userEmail.split('@')[0],
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 5,
            ),
            AppSmallText(
                text: text,
                color: isMe == user.email ? Colors.white : Colors.black),
            const SizedBox(height: 4.0),
            AppSmallText(
                text: formatDate(timestamp),
                size: 12.0,
                color: isMe == user.email ? Colors.black : Colors.grey),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    // Format the timestamp here, e.g., "HH:mm" for hours and minutes.
    return "${dateTime.hour}:${dateTime.minute}";
  }
}
