class Record {
  String id;
  static const altitude = 20000;
  static const interval = 100;
  List<RecordItem> recordItems;

  Record({required this.id, required this.recordItems});
}

class RecordItem {
  int id;
  int height;
  double actualTemperature;
  double virtualTemperature;
  double pressure;
  double relativeHumidity;
  double windSpeed;
  double windDirection;

  RecordItem({
    required this.id,
    required this.height,
    required this.actualTemperature,
    required this.virtualTemperature,
    required this.pressure,
    required this.relativeHumidity,
    required this.windSpeed,
    required this.windDirection,
  });
}
