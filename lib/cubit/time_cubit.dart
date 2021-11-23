import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_cubit_bloc_tutorial/data/weather_repository.dart';

part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  final WeatherRepository time;
  TimeCubit(this.time) : super(TimeInitial());
}


