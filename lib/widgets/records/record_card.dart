import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/query_model.dart';
import '../../screens/records_result.dart';
import '../../utils/router.dart';
import '../../utils/styles.dart';

/// Gesture detecting widget that displays information of a saved query as a card.
/// Visible on the Observation History / Record screen.
class RecordCard extends StatelessWidget {
  /// List of queries from the database.
  final List<QueryModel> queryList;

  /// Index of the current query to be displayed in this list.
  final int index;

  /// Constructor for gesture detecting widget that displays information of a saved query as a card.
  /// Requires
  /// 1. A list of queries from the database.
  /// 2. Index of the current query to be displayed.
  ///
  /// To do: Make the solution more elegant than passing a list of queries - state mgmt.
  const RecordCard({super.key, required this.queryList, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final queryid = queryList[index].id;
        final latitude = queryList[index].latitude;
        final longitude = queryList[index].longitude;
        Navigate.pushPage(
          context,
          RecordResult(
            queryid: queryid,
            latitude: latitude,
            longitude: longitude,
          ),
        );
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          side: BorderSide(color: ColorSelection.primary),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Container(
            decoration: const BoxDecoration(
              color: ColorSelection.neutralContainer,
              border: Border(
                left: BorderSide(
                  color: ColorSelection.primary,
                  width: 5,
                ),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: ColorSelection.primary,
                      size: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${queryList[index].latitude.toStringAsFixed(2)}, ${queryList[index].longitude.toStringAsFixed(2)}',
                          style: TextStyleSelection.recordCardTitle,
                        ),
                        Text(
                          '${queryList[index].location}',
                          style: TextStyleSelection.recordCardSubtitle,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat('dd-MM-yy').format(queryList[index].created),
                      style: TextStyleSelection.regularTextTitle,
                    ),
                    Text(
                      DateFormat.jm().format(queryList[index].created),
                      style: TextStyleSelection.regularText,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
