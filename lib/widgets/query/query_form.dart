import 'package:flutter/material.dart';

import '../../utils/router.dart';
import '../../screens/query_result.dart';
import '../action_btn_filled.dart';
import '../action_btn_outlined.dart';
import './text_field.dart';

class QueryForm extends StatefulWidget {
  const QueryForm({super.key});

  @override
  State<QueryForm> createState() => _QueryFormState();
}

class _QueryFormState extends State<QueryForm> {
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();

  void _querySearch(BuildContext context) {
    double latitude = double.parse(_latitudeController.text);
    double longitude = double.parse(_longitudeController.text);

    Navigate.pushPage(
      context,
      QueryResult(latitude: latitude, longitude: longitude),
    );
  }

  void _clear() {
    _latitudeController.clear();
    _longitudeController.clear();
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
