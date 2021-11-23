part of 'weather_cubit.dart';
//! We're creating states for asyncronous loading web sources
@immutable
abstract class WeatherState {
  const WeatherState();
}
//! This one is before user took any action
// In this case its only initial search bar
class WeatherInitial extends WeatherState {
  const WeatherInitial();
}
// This one is emitted when we're waiting for data to be resolved
// Or could say waiting for future to complete
class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded(this.weather);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherLoaded && o.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
