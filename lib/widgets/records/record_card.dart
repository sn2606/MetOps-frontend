import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/query_model.dart';
import '../../screens/records_result.dart';
import '../../utils/styles.dart';
import '../../utils/router.dart';

class RecordCard extends StatelessWidget {
  final List<QueryModel> queryList;
  final int index;

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
                          '${queryList[index].latitude}, ${queryList[index].longitude}',
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
