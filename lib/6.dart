

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'weather_api.dart';

class WeatherApi {
  final String apiKey = '880570bf93c6b12ba6416a5f210ec4c7';
  final String baseUrl = '(link unavailable)';

  Future<Map<String, dynamic>> getWeatherData(double latitude, double longitude) async {
    final url = '$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}


class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherApi _weatherApi = WeatherApi();
  double? _latitude;
  double? _longitude;
  Map<String, dynamic>? _weatherData;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _latitude = position.latitude;
      _longitude = position.longitude;
    });
    _getWeatherData();
  }

  Future<void> _getWeatherData() async {
    final weatherData = await _weatherApi.getWeatherData(_latitude!, _longitude!);
    setState(() {
      _weatherData = weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_weatherData != null)
              Text(
                'Temperature: ${_weatherData!['current']['temp']}°C',
                style: TextStyle(fontSize: 24),
              ),
            if (_weatherData != null)
              Text(
                'Weather: ${_weatherData!['current']['weather'][0]['description']}',
                style: TextStyle(fontSize: 24),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getLocation,
              child: Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: WeatherScreen(),
    );
  }
}

