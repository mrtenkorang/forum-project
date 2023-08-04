// import 'package:flutter/material.dart';
//
// void main() => runApp(ChatApp());
//
// class ChatApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChatScreen(),
//     );
//   }
// }
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   List<Map<String, dynamic>> messages = [
//     {
//       'text': "Hey there!",
//       'isMe': false,
//       'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
//     },
//     {
//       'text': "Hello!",
//       'isMe': true,
//       'timestamp': DateTime.now().subtract(Duration(minutes: 3)),
//     },
//     // Add more sample messages here
//   ];
//
//   TextEditingController _messageController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Chat App')),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: ChatContainer(messages: messages),
//             ),
//             _buildMessageComposer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ChatContainer extends StatelessWidget {
//   final List<Map<String, dynamic>> messages;
//
//   ChatContainer({required this.messages});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       child: ListView.builder(
//         itemCount: messages.length,
//         itemBuilder: (context, index) => ChatBubble(
//           text: messages[index]['text'],
//           isMe: messages[index]['isMe'],
//           timestamp: messages[index]['timestamp'],
//         ),
//       ),
//     );
//   }
// }
