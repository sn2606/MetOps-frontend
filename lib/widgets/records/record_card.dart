import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/record.dart';
import '../../utils/colors.dart';

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
          side: BorderSide(color: primary),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Container(
            decoration: BoxDecoration(
              color: neutralContainer,
              border: Border(
                left: BorderSide(
                  color: primary,
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
                      color: primary,
                      size: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${recordsList[index].latitude}, ${recordsList[index].longitude}',
                          style: TextStyle(
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${recordsList[index].location}',
                          style: TextStyle(
                            color: primary,
                            fontSize: 14,
                          ),
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
                      style: TextStyle(
                        color: primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      DateFormat.jm().format(recordsList[index].created),
                      style: TextStyle(
                        color: primary,
                        fontSize: 12,
                      ),
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
