import 'package:bloc/bloc.dart';
import 'package:weather/features/weather_feature/presentation/bloc/state.dart';
import '../../domain/usecase/get_weather_usecase.dart';
import 'event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  String _selectedDay = 'today';

  WeatherBloc({required this.getWeatherUseCase}) : super(WeatherInitial()) {
    on<FetchWeather>(_onFetchWeather);
    on<ChangeDay>(_onChangeDay);
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      print('Fetching weather for: ${event.address}');
      final weather = await getWeatherUseCase.call(event.address);
      emit(WeatherLoaded(weather, _selectedDay));
    } catch (e) {
      emit(WeatherError('Ошибка загрузки погоды: ${e.toString()}'));
    }
  }

  Future<void> _onChangeDay(ChangeDay event, Emitter<WeatherState> emit) async {
    print('Changing day to: ${event.day}');

    if (_selectedDay == event.day) {
      return;
    }

    _selectedDay = event.day;

    if (state is WeatherLoaded) {
      final currentWeather = (state as WeatherLoaded).weather;
      emit(WeatherLoaded(currentWeather, _selectedDay));
    }
  }
}
