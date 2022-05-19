part of 'cities_bloc.dart';

abstract class CitiesEvent extends Equatable {
  const CitiesEvent();

  @override
  List<Object> get props => [];
}

class LoadingCities extends CitiesEvent{
  final List<City> cities;
  const LoadingCities({this.cities = const <City>[]});
  @override
  List<Object> get props => [cities];
}

class LoadCitiesOffline extends CitiesEvent{
  final List<City> cities;
  const LoadCitiesOffline({this.cities = const <City>[]});

  @override
  List<Object> get props => [cities];
}

class LoadCitiesOnline extends CitiesEvent{
  final List<City> cities;
  const LoadCitiesOnline({this.cities = const <City>[]});

  @override
  List<Object> get props => [cities];
}