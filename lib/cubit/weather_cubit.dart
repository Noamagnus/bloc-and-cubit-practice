import 'package:bloc/bloc.dart';
import 'package:flutter_cubit_bloc_tutorial/data/model/weather.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

//! Cubit emits different states
class WeatherCubit extends Cubit<WeatherState> {
  //!We're preparing for dependency injection by having a field

  final WeatherRepository _weatherRepository; 

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());
//We don't wanna returnd anything we just want this method to be async 
  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
