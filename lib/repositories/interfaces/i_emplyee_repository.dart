import 'package:apchance_recruitment/models/employees_model.dart';

abstract class IEmployeeRepository{
  Future<List<Employee>> getEmployeesOnline();
  List<Employee> getEmployeesOffline();
}