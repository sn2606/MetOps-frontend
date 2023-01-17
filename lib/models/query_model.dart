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

  factory QueryModel.fromJson(Map<String, dynamic> json) {
    return QueryModel(
      id: json['id'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      location: json['location'],
      created: DateTime.parse(json['created']).toLocal(),
    );
  }
}
