class Utilities {
  static String countToString(int count) {
    if (count > 1000000000)
      return (count / 1000000000).toStringAsFixed(1) + 'B';
    if (count > 1000000) return (count / 1000000).toStringAsFixed(1) + 'M';
    if (count > 1000) return (count / 1000).toStringAsFixed(1) + 'k';
    return count.toString() + '';
  }

  static String dateTimeToDuration(DateTime date) {
    Duration diff = DateTime.now().difference(date);
    if (diff.inDays > 365) return (diff.inDays~/365).toString()+' years ago';
    if (diff.inDays > 30) return (diff.inDays~/30).toString()+' months ago';
    if (diff.inDays < 2) return '${diff.inHours} hours ago';
    else return diff.inDays.toString()+' days ago';
  }
}
