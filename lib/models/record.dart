class Record {
  String id;
  static const altitude = 20000;
  static const interval = 100;
  List<RecordItem> recordItems;

  Record({required this.id, required this.recordItems});
}

class RecordItem {
  int? id;
  int height;
  double actualTemperature;
  double virtualTemperature;
  double pressure;
  double relativeHumidity;
  double windSpeed;
  double windDirection;

  RecordItem({
    this.id,
    required this.height,
    required this.actualTemperature,
    required this.virtualTemperature,
    required this.pressure,
    required this.relativeHumidity,
    required this.windSpeed,
    required this.windDirection,
  });

  factory RecordItem.fromJson(Map<String, dynamic> json) {
    return RecordItem(
      height: json['height'],
      actualTemperature: double.parse(json['temperature']),
      virtualTemperature: double.parse(json['virtual_temperature']),
      pressure: double.parse(json['pressure']),
      relativeHumidity: double.parse(json['relative_humidity']),
      windSpeed: double.parse(json['wind_speed']),
      windDirection: double.parse(json['wind_direction']),
    );
  }

  factory RecordItem.fromJsonDetail(Map<String, dynamic> json) {
    return RecordItem(
      id: json['id'],
      height: json['height'],
      actualTemperature: double.parse(json['temperature']),
      virtualTemperature: double.parse(json['virtual_temperature']),
      pressure: double.parse(json['pressure']),
      relativeHumidity: double.parse(json['relative_humidity']),
      windSpeed: double.parse(json['wind_speed']),
      windDirection: double.parse(json['wind_direction']),
    );
  }
}
