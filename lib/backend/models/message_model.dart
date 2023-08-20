import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String userEmail;
  final Timestamp time;

  MessageModel({
    required this.message,
    required this.userEmail,
    required this.time,
  });
}
