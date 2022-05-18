import 'package:apchance_recruitment/objectbox.g.dart';
import 'package:apchance_recruitment/repositories/city_repository.dart';
import 'package:apchance_recruitment/repositories/interfaces/i_database_repository.dart';

class ObjectBoxRepository implements IDatabaseRepository{
  final Store _store;
  @override
  final CityRepository cities;
  static Future<ObjectBoxRepository> create() async =>
      ObjectBoxRepository._(await openStore());

      ObjectBoxRepository._(this._store) : cities = CityRepository(_store);
}