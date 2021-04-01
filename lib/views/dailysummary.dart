import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_provider_app/models/weather.dart';
import 'package:weather_provider_app/utils/tempconvert.dart';

class DailySummaryView extends StatelessWidget {
  final Weather weather;

  DailySummaryView({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final dayOfWeek =
        toBeginningOfSentenceCase(DateFormat('EEE').format(this.weather.date));

    return Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(dayOfWeek ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300)),
              Text(
                  "${TemperatureConvert.kelvinToCelsius(this.weather.temp).round().toString()}°",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
            ]),
            Padding(
                padding: EdgeInsets.only(left: 5),
                child: Container(
                    alignment: Alignment.center,
                    child: _mapWeatherConditionToImage(this.weather.condition)))
          ],
        ));
  }

  Widget _mapWeatherConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.thunderStorm:
        image = Image.asset('assets/images/thunder.png');
        break;
      case WeatherCondition.cloudy:
        image = Image.asset('assets/images/cloudy.png');
        break;
      case WeatherCondition.drizzle:
        image = Image.asset('assets/images/drizzle.png');
        break;
      case WeatherCondition.clear:
        image = Image.asset('assets/images/clear.png');
        break;
      case WeatherCondition.fog:
        image = Image.asset('assets/images/fog.png');
        break;
      case WeatherCondition.snow:
        image = Image.asset('assets/images/snow.png');
        break;
      case WeatherCondition.rain:
        image = Image.asset('assets/images/rain.png');
        break;
      case WeatherCondition.atmosphere:
        image = Image.asset('assets/images/atmosphere.png');
        break;

      default:
        image = Image.asset('assets/images/unknown.png');
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: image);
  }
}
