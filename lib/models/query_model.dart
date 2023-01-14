class QueryModel {
  int? id;
  double latitude;
  double longitude;
  String? location;
  DateTime created;

  QueryModel({
    this.id,
    required this.latitude,
    required this.longitude,
    this.location,
    required this.created,
  });
}
