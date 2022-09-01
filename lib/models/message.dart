import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  late final String name;
  late final String text;
  late final Timestamp time;

  Message({
    required this.name,
    required this.time,
    required this.text,
  });

  Message.fromCollection(Map<String, dynamic> collection) {
    name = collection['name'] ?? "";
    text = collection['text'] ?? "";
    time = collection['time'] ?? Timestamp.now();
  }

  Map<String, dynamic> toCollection() {
    return {
      'name': name,
      'text': text,
      'time': time,
    };
  }
}
