class QueryModel {
  int id;
  double latitude;
  double longitude;
  String? location;
  DateTime created;

  QueryModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    this.location,
    required this.created,
  });
}
