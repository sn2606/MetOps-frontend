/// Backend endpoints.
/// Abstracted into a class for ease of change.
class Endpoints {
  /// IP address & port
  static const String authority = '10.0.2.2:8000';

  /// URL for Query request as defined in backend.
  static const String askQuery = '/api/query/';

  /// URL for retrieve saved Queries request as defined in backend.
  static const String queryList = '/api/query/list';

  /// URL for save current Query request as defined in backend.
  static const String saveQuery = '/api/query/save/';

  /// URL for Authentication request as defined in backend.
  static const String login = '/api/users/login/';

  /// URL for Authenticated account information request as defined in backend.
  static const String accountInfo = '/api/users/account/';

  /// URL for retrieve Record items request as defined in backend.
  static const String recordDetail = '/api/records/view/';

  /// URL for delete saved Query and corresponding Record items request as defined in backend.
  static const String deleteRecord = '/api/records/delete/';
}
