part of 'weather_block_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWether extends WeatherBlocEvent {
  final Position position;

  const FetchWether(this.position);

  @override
  List<Object> get props => [position];
}
