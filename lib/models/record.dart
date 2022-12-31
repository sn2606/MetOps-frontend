class Record {
  String id;
  static const altitude = 20000;
  static const interval = 100;
  double latitude;
  double longitude;
  String? location;
  List<double> actualTemperature;
  List<double> virtualTemperature;
  List<double> pressure;
  List<double> humidity;
  List<double> windSpeed;
  List<double> windDirection;
  DateTime created;

  Record({
    required this.id,
    this.location,
    required this.latitude,
    required this.longitude,
    required this.actualTemperature,
    required this.humidity,
    required this.pressure,
    required this.virtualTemperature,
    required this.windDirection,
    required this.windSpeed,
    required this.created,
  });
}
