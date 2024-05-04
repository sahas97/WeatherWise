import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weatherwise/data/my_data.dart';

part 'weather_block_event.dart';
part 'weather_block_state.dart';

class WeatherBlockBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlockBloc() : super(WeatherBlocInitial()) {
    on<FetchWether>((event, emit) async {
      // stsrt to get weather data set loding
      emit(WeatherBlocLoading());
      try {
        WeatherFactory weatherFactory =
            WeatherFactory(API_KEY, language: Language.ENGLISH);
  
        Weather weather = await weatherFactory.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeatherBlockSuccess(weather));
      } catch (e) {
        // fetch failed emit Failure
        emit(WeatherBlocFailure());
      }
    });
  }
}


