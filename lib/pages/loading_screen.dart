import 'package:flutter/material.dart';
import 'package:weather_with_api/pages/location_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_with_api/brain/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0;
  double longitude = 0;
  @override
  void initState() {
    super.initState();
    getCurrentLocationData();
  }

  void getCurrentLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    print(weatherData);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SpinKitCubeGrid(
          color: Colors.yellow,
          size: 200,
        ),
        SizedBox(
          height: 40,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 40,
          ),
          Text(
            'LOADING...',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ])
      ],
    ));
  }
}
