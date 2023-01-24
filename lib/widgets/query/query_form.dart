import 'package:flutter/material.dart';

import './text_field.dart';
import '../action_btn_filled.dart';
import '../action_btn_outlined.dart';
import '../../screens/query_result.dart';
import '../../utils/router.dart';

/// Widget that renders the Query Form.
class QueryForm extends StatefulWidget {
  /// Constructor for widget that renders the Query Form.
  const QueryForm({super.key});

  @override
  State<QueryForm> createState() => _QueryFormState();
}

class _QueryFormState extends State<QueryForm> {
  /// Track Latitude value
  final _latitudeController = TextEditingController();

  /// Track Longitude value
  final _longitudeController = TextEditingController();

  /// Method that is called when user presses search button.
  void _querySearch(BuildContext context) {
    // unfocus keyboard first
    FocusManager.instance.primaryFocus?.unfocus();

    // Read final latitude and longitude values
    double latitude = double.parse(_latitudeController.text);
    double longitude = double.parse(_longitudeController.text);

    // Fetch result for query
    Navigate.pushPage(
      context,
      QueryResult(latitude: latitude, longitude: longitude),
    );
  }

  /// Method that is called when user presses clear button.
  void _clear() {
    _latitudeController.clear();
    _longitudeController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextFieldCustom(
              hint: 'Latitude',
              controller: _latitudeController,
            ),
            TextFieldCustom(
              hint: 'Longitude',
              controller: _longitudeController,
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            ActionButtonFilled(
              title: 'Search',
              onPressed: () => _querySearch(context),
            ),
            ActionButtonOutlined(
              title: 'Cancel',
              onPressed: _clear,
            )
          ],
        ),
      ],
    );
  }
}
