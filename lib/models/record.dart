/// Models associated with the concept of Records in system design.
/// When a query is asked, the request gives RecordItem instances as responses.
/// Since upper air data is considered, multiple RecordItem instances correspond
/// to one query.

/// List of Records associated with a query.
class Record {
  String id;
  static const altitude = 20000;
  static const interval = 100;
  List<RecordItem> recordItems;

  Record({required this.id, required this.recordItems});
}

/// Individual Record Items associated with a query
class RecordItem {
  /// Data Parameters that a RecordItem is made of.

  /// An id integer is assigned once user saves the query & records.
  int? id;

  /// Weather parameters provided are at (height) altitude in meters
  int height;

  /// Actual Temperature in °C at (height m)
  double actualTemperature;

  /// Virtual Temperature in °C at (height m)
  double virtualTemperature;

  /// Virtual Temperature in hPa at (height m)
  double pressure;

  /// Relative Humidity in % at (height m)
  double relativeHumidity;

  // Wind speed in km/h at (height m)
  double windSpeed;

  // Wind direction in degrees from north at (height m)
  double windDirection;

  /// Constructor for the class.
  /// id is not required, as it is assigned once the RecordItem is saved in the database.
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

  /// Create an instance of RecordItem from JSON values
  factory RecordItem.fromJson(Map<String, dynamic> json) {
    return RecordItem(
      height: int.parse(json['height']),
      actualTemperature: double.parse(json['temperature']),
      virtualTemperature: double.parse(json['virtual_temperature']),
      pressure: double.parse(json['pressure']),
      relativeHumidity: double.parse(json['relative_humidity']),
      windSpeed: double.parse(json['wind_speed']),
      windDirection: double.parse(json['wind_direction']),
    );
  }

  /// Create an instance of RecordItem from JSON values
  /// Required while building the result table for query
  factory RecordItem.fromJsonTable(Map<String, dynamic> json) {
    return RecordItem(
      height: json['height'],
      actualTemperature: json['temperature'],
      virtualTemperature: json['virtual_temperature'],
      pressure: json['pressure'],
      relativeHumidity: json['relative_humidity'],
      windSpeed: json['wind_speed'],
      windDirection: json['wind_direction'],
    );
  }

  /// Create an instance of RecordItem from JSON values
  /// Required while building the record table for a saved record
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
