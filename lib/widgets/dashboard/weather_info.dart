import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

import '../../utils/styles.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({super.key});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  late Future<http.Response> _response;
  late String _city;
  late double _latitude;
  late double _longitude;
  late double _temperature;
  late double _pressure;
  late double _relativehumidity;
  late double _windspeed;
  late double _winddirection;
  dynamic _currentPosition;

  Future<http.Response> _fetchWeatherInfo() async {
    try {
      _currentPosition = await _getAddressFromLatLong();
      _latitude = _currentPosition['latitude'];
      _longitude = _currentPosition['longitude'];
      _city = _currentPosition['city'];
      final date = DateFormat('yyyy-MM-dd').format(DateTime.now().toUtc());
      final match =
          DateFormat('yyyy-MM-ddTHH:00').format(DateTime.now().toUtc());
      if (_currentPosition != null) {
        final uri = Uri.parse(
            "https://api.open-meteo.com/v1/forecast?latitude=$_latitude&longitude=$_longitude&current_weather=true&hourly=relativehumidity_2m,surface_pressure&start_date=$date&end_date=$date");
        http.Response response = await http.get(uri, headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        });

        if (response.statusCode == 200) {
          final result = jsonDecode(response.body);
          double temp = result['current_weather']['temperature'];
          double windSpeed = result['current_weather']['windspeed'];
          double windDir = result['current_weather']['winddirection'];
          int index = result['hourly']['time'].indexOf(match);
          double relHum =
              result['hourly']['relativehumidity_2m'][index].toDouble();
          double pressure = result['hourly']['surface_pressure'][index];
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
                child: Text('An error occured.'),
              );
            } else {
              final res = snapshot.data;
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
                  child: Text('Could not receive data.'),
                );
              }
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occured.'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorSelection.primary,
              ),
            );
          }
        }));
  }

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
