import 'package:apchance_recruitment/models/cities_model.dart';

abstract class ICityRepository{
  Future<List<City>> getCitiesOnline();
  List<City> getCitiesOffline();
}