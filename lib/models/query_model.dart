/// Model for a Query asked by the user.
/// A query has multiple records associated with it
/// (foreign key on id from a Record ID to Query ID)

/// Query details
class QueryModel {
  /// Query id as in the database
  int id;

  /// Latitude - as entered by the user (°N)
  double latitude;

  /// Longitude - as entered by the user (°E)
  double longitude;

  /// Location - result of the reverse geocoding API in the backend
  String? location;

  /// Created - timestamp of query asked by the user
  DateTime created;

  /// Constructor
  /// Location may be a null value, also allowed in the database
  QueryModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    this.location,
    required this.created,
  });

  /// Create an instance of the model from json data.
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
