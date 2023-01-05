import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.location_on,
          size: 30,
          color: ColorSelection.primary,
        ),
        SizedBox(
          height: 13,
        ),
        Text(
          'Pune',
          style: TextStyleSelection.regularTextTitle,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Clear, 19°C',
          style: TextStyleSelection.regularText,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '56% Humidity',
          style: TextStyleSelection.regularText,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '15kph Wind Gusts',
          style: TextStyleSelection.regularText,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '18.52° N, 73.85° E',
          style: TextStyleSelection.regularText,
        ),
      ],
    );
  }
}
