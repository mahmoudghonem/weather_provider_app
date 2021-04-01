import 'package:weather_provider_app/models/forecast.dart';
import 'package:weather_provider_app/models/location.dart';

abstract class WeatherApi {
  Future<Forecast> getWeather(Location location);
  Future<Location> getLocation(String city);
}
