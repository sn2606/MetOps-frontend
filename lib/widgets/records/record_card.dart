import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/record.dart';
import '../../utils/styles.dart';

class RecordCard extends StatelessWidget {
  final List<Record> recordsList;
  final int index;

  const RecordCard({super.key, required this.recordsList, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          side: BorderSide(color: ColorSelection.primary),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Container(
            decoration: BoxDecoration(
              color: ColorSelection.neutralContainer,
              border: Border(
                left: BorderSide(
                  color: ColorSelection.primary,
                  width: 5,
                ),
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorSelection.primary,
                      size: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${recordsList[index].latitude}, ${recordsList[index].longitude}',
                          style: TextStyleSelection.recordCardTitle,
                        ),
                        Text(
                          '${recordsList[index].location}',
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
                      DateFormat('dd-MM-yy').format(recordsList[index].created),
                      style: TextStyleSelection.regularTextTitle,
                    ),
                    Text(
                      DateFormat.jm().format(recordsList[index].created),
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
