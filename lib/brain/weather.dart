import 'package:weather_with_api/brain/networking.dart';

import 'location.dart';

const api_key = 'a2b19df868bbe0a934c8662593b24052';

class WeatherModel {
  Future<dynamic> getReturnedCityWeather(String cityName) async {
    Uri uri = Uri.https('api.openweathermap.org', 'data/2.5/weather', {
      'q': '$cityName',
      'appid': '$api_key',
    });
    var returnedWeatherData = await NetworkBrain(uri).getData();
    print(returnedWeatherData);
    return returnedWeatherData;
  }

  Future<dynamic> getLocationWeather() async {
    LocationHandler locationHandler = LocationHandler();
    await locationHandler.getLocation();
    Uri uri = Uri.https('api.openweathermap.org', 'data/2.5/weather', {
      'lat': '${locationHandler.latitude}',
      'lon': '${locationHandler.longitude}',
      'appid': '$api_key',
    });
    NetworkBrain networkBrain = NetworkBrain(uri);
    var weatherData = await networkBrain.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(num temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
