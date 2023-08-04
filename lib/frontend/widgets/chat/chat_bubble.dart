import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  ChatBubble({required this.text, required this.isMe, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    final alignment = isMe ? Alignment.centerRight : Alignment.centerLeft;
    final bubbleColor = isMe ? Colors.blue : Colors.grey[300];

    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),
            SizedBox(height: 4.0),
            Text(
              formatDate(timestamp),
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
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
