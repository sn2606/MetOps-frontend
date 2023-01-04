import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Icon(
              Icons.location_on,
              size: 30,
              color: ColorSelection.primary,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text(
              'Pune',
              style: TextStyleSelection.regularTextTitle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              'Clear, 19°C',
              style: TextStyleSelection.regularText,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              '56% Humidity',
              style: TextStyleSelection.regularText,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              '15kph Wind Gusts',
              style: TextStyleSelection.regularText,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              '18.52° N, 73.85° E',
              style: TextStyleSelection.regularText,
            ),
          )
        ],
      ),
    );
  }
}
