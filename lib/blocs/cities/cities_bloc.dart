import 'dart:async';

import 'package:apchance_recruitment/blocs/connect/connect_bloc.dart';
import 'package:apchance_recruitment/models/cities_model.dart';
import 'package:apchance_recruitment/repositories/city_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {

  final ConnectBloc connectBloc;
  final CityRepository _cityRepository;
  StreamSubscription? connectionSubscription;

  CitiesBloc(this._cityRepository,this.connectBloc) : super(CitiesLoading()) {
    on<LoadingCities>(_onLoadingCities);
    on<LoadCitiesOnline>(_onLoadCitiesOnline);
    on<LoadCitiesOffline>(_onLoadCitiesOffline);
    listenConnectivity();
  }

  void _onLoadingCities(LoadingCities event, Emitter<CitiesState> emit) async {
    emit(
        const CitiesLoaded()
    );
  }

  void _onLoadCitiesOnline(LoadCitiesOnline event, Emitter<CitiesState> emit) async {
    final List<City> cities = await _cityRepository.getCitiesOnline();
    emit(
        CitiesLoaded(cities: cities)
    );

  }

  _onLoadCitiesOffline(LoadCitiesOffline event, Emitter<CitiesState> emit) {
    final List<City> cities = _cityRepository.getCitiesOffline();
    emit(
        CitiesLoaded(cities: cities)
    );
  }

  void listenConnectivity(){
    if(connectBloc.state is ConnectionSuccess){
      add(const LoadCitiesOnline());
    }else{
      add(const LoadCitiesOffline());
    }
    connectionSubscription = connectBloc.stream.listen((state) {
      if(state is ConnectionSuccess){
        add(const LoadCitiesOnline());
      }else if(state is ConnectionOffline){
        add(const LoadCitiesOffline());
      }
    });
  }


}
