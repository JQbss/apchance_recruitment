import 'package:apchance_recruitment/objectbox.g.dart';
import 'package:apchance_recruitment/repositories/employee_repository.dart';
import 'package:apchance_recruitment/repositories/interfaces/i_database_repository.dart';

class ObjectBoxRepository implements IDatabaseRepository{
  final Store _store;
  @override
  final EmployeeRepository employees;
  static Future<ObjectBoxRepository> create() async =>
      ObjectBoxRepository._(await openStore());

      ObjectBoxRepository._(this._store) : employees = EmployeeRepository(_store);
}