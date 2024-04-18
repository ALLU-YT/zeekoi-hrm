String formatStringDateToDDMMM(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  List<String> monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  int day = dateTime.day;
  int month = dateTime.month;
  String monthAbbreviation = monthNames[month - 1];
  String formattedDate = '$monthAbbreviation $day';
  return formattedDate;
}
