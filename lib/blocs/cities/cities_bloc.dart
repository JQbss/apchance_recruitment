import 'package:apchance_recruitment/models/cities_model.dart';
import 'package:apchance_recruitment/repositories/city_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {

  final CityRepository _cityRepository;

  CitiesBloc(this._cityRepository) : super(CitiesLoading()) {
    on<LoadCities>(_onLoadCities);
  }

  void _onLoadCities(LoadCities event, Emitter<CitiesState> emit) async {
    emit(CitiesLoading());
    final List<City> cities = await _cityRepository.getCities();
    emit(
      CitiesLoaded(cities: cities)
    );
  }
}
