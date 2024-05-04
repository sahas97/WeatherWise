part of 'weather_block_bloc.dart';

sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {}

final class WeatherBlockSuccess extends WeatherBlocState {
  final Weather weather;

  const WeatherBlockSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}
