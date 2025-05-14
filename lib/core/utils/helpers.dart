import 'package:intl/intl.dart';

class Helpers {
  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String formatTime(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }

  static String getInitials(String name) {
    return name.isNotEmpty
        ? name.trim().split(' ').map((e) => e[0]).take(2).join().toUpperCase()
        : '';
  }
}
