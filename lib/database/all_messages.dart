import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:knustforum/backend/models/message_model.dart';

class AllMessageDB {
  CollectionReference? allMessageCollection;
  AllMessageDB() {
    allMessageCollection =
        FirebaseFirestore.instance.collection('all-messages');
  }

  //save the message to the database
  Future<void> saveMessage(
      String message, DateTime time, String userEmail) async {
    await allMessageCollection!.doc().set(
      {
        'message': message,
        'time': time,
        'isMe': userEmail,
      },
    );
  }

  // get the message from the db
  Iterable<MessageModel> _messageList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic> data =
          doc.data() as Map<String, dynamic>; // Cast to Map<String, dynamic>
      return MessageModel(
        message: data['message'] ?? '',
        userEmail: data['isMe'] ?? '',
        time: data['time'] ?? '',
      );
    }).toList();
  }

  // Listen for changes int he messages db
  Stream<Iterable<MessageModel>> get getAllMessages {
    return allMessageCollection!.snapshots().map(_messageList);
  }
}
