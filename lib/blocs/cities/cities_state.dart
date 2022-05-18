part of 'cities_bloc.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();
}

class CitiesLoading extends CitiesState {
  @override
  List<Object> get props => [];
}

class CitiesLoaded extends CitiesState{
  final List<City> cities;
  const CitiesLoaded({this.cities = const <City>[]});

  @override
  List<Object?> get props => [cities];


}
