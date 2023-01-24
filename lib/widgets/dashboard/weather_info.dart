import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../utils/styles.dart';

/// Widget to display weather information of current location of the phone.
class WeatherInfo extends StatefulWidget {
  /// Constructor for widget to display weather information of current location of the phone.
  const WeatherInfo({super.key});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  /// Holds the response of the weather information request
  late Future<http.Response> _response;
  // Information to be displayed on the card
  late String _city;
  late double _latitude;
  late double _longitude;
  late double _temperature;
  late double _pressure;
  late double _relativehumidity;
  late double _windspeed;
  late double _winddirection;
  dynamic _currentPosition;

  /// GET weather information from Open-Meteo API and process it.
  /// Returns dynamic information if everything goes over correctly.
  /// To do: Fix bottleneck
  Future<http.Response> _fetchWeatherInfo() async {
    try {
      // Get current location of the device using geolocation and geocoding packages.
      _currentPosition = await _getAddressFromLatLong();
      if (_currentPosition != null) {
        _latitude = _currentPosition['latitude'];
        _longitude = _currentPosition['longitude'];
        _city = _currentPosition['city'];
        // Start date and End date to fetch from API.
        final date = DateFormat('yyyy-MM-dd').format(DateTime.now().toUtc());
        // API returns time series with interval length of 1 hour.
        // To get information of current hour, find index of element which is [match].
        final match =
            DateFormat('yyyy-MM-ddTHH:00').format(DateTime.now().toUtc());
        // GET url. Requested forecast since current_weather does not include Pressure and Relative Humidity.
        final uri = Uri.parse(
            "https://api.open-meteo.com/v1/forecast?latitude=$_latitude&longitude=$_longitude&current_weather=true&hourly=relativehumidity_2m,surface_pressure&start_date=$date&end_date=$date");
        http.Response response = await http.get(uri, headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        });

        // If there is no error
        if (response.statusCode == 200) {
          // processing the result
          final result = jsonDecode(response.body);
          double temp = result['current_weather']['temperature'];
          double windSpeed = result['current_weather']['windspeed'];
          double windDir = result['current_weather']['winddirection'];
          int index = result['hourly']['time'].indexOf(match);
          double relHum =
              result['hourly']['relativehumidity_2m'][index].toDouble();
          double pressure = result['hourly']['surface_pressure'][index];
          // defining response body in format we'll use.
          final responseNew = {
            'latitude': _latitude,
            'longitude': _longitude,
            'city': _city,
            'temperature': temp,
            'pressure': pressure,
            'relativehumidity': relHum,
            'windspeed': windSpeed,
            'winddirection': windDir,
          };
          return http.Response(jsonEncode(responseNew), 200);
        } else {
          // the response will contain status code other than 200
          return response;
        }
      } else {
        throw Exception('Could not get your location.');
      }
    } catch (error) {
      return http.Response(error.toString(), 400);
    }
  }

  @override
  void initState() {
    super.initState();
    _response = _fetchWeatherInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
        future: _response,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Center(
                child: Text(
                  'An error occured.',
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              // null checked before.
              final res = snapshot.data;
              // If response code is 200, it contains the [responseNew] body
              if (res!.statusCode == 200) {
                final result = jsonDecode(res.body);
                _latitude = result['latitude'];
                _longitude = result['longitude'];
                _city = result['city'];
                _temperature = result['temperature'];
                _pressure = result['pressure'];
                _relativehumidity = result['relativehumidity'];
                _windspeed = result['windspeed'];
                _winddirection = result['winddirection'];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 30,
                      color: ColorSelection.primary,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      _city,
                      style: TextStyleSelection.regularTextTitle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$_temperature°C, ${_pressure}hPa',
                      style: TextStyleSelection.regularText,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '$_relativehumidity% humidity',
                      style: TextStyleSelection.regularText,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${_windspeed}kmh wind, $_winddirection°',
                      style: TextStyleSelection.regularText,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      // '$_latitude, $_longitude',
                      '${_latitude.toStringAsFixed(2)}, ${_longitude.toStringAsFixed(2)}',
                      style: TextStyleSelection.regularText,
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text(
                    'Could not receive data.',
                    textAlign: TextAlign.center,
                  ),
                );
              }
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'An error occured.',
                textAlign: TextAlign.center,
              ),
            );
          } else {
            // while it is loading
            return const Center(
              child: CircularProgressIndicator(
                color: ColorSelection.primary,
              ),
            );
          }
        }));
  }

  /// Helper method that returns city of location of device
  /// from latitude and longitude (reverse geocoding) if
  /// user has granted location permission.
  Future<dynamic> _getAddressFromLatLong() async {
    _currentPosition = await _getCurrentPosition();

    if (_currentPosition != null) {
      _latitude = _currentPosition['latitude'];
      _longitude = _currentPosition['longitude'];

      List<Placemark> placemarks =
          await placemarkFromCoordinates(_latitude, _longitude).catchError((e) {
        debugPrint(e.toString());
      });
      Placemark place = placemarks[0];
      _city = '${place.subAdministrativeArea}';
      return {
        'latitude': _latitude,
        'longitude': _longitude,
        'city': _city,
      };
    }

    return null;
  }

  /// Helper method that returns latitude and longitude of location of device if
  /// user has granted location permission.
  Future<dynamic> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      return null;
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      forceAndroidLocationManager: false,
    );
    return {
      'latitude': position.latitude,
      'longitude': position.longitude,
    };
  }

  /// Helper method to check if user has granted location permission.
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}
