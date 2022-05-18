part of 'cities_bloc.dart';

abstract class CitiesEvent extends Equatable {
  const CitiesEvent();

  @override
  List<Object> get props => [];
}

class LoadCities extends CitiesEvent{
  final List<City> cities;
  const LoadCities({this.cities = const <City>[]});

  @override
  List<Object> get props => [cities];
}
