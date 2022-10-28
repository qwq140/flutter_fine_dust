class DataUtils {
  static convertDateTimeToString(DateTime dateTime){
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}';
  }
}