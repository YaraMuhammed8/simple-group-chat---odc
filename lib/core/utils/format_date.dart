import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatDate(Timestamp timestamp) {
  DateTime now = DateTime.now();
  DateTime date = timestamp.toDate();
  if (now.year == date.year) {
    if (now.month == date.month && now.day == date.day) {
      return DateFormat.jm().format(date);
    } else {
      return DateFormat.MMMd().add_jm().format(date);
    }
  } else {
    return DateFormat.yMMMd().add_jm().format(date);
  }
}