part of 'employees_bloc.dart';

abstract class EmployeesEvent extends Equatable {
  const EmployeesEvent();
}

class LoadingEmployees extends EmployeesEvent{
  final List<Employee> employees;
  const LoadingEmployees({this.employees = const <Employee>[]});

  @override
  List<Object?> get props => [employees];

}

class LoadEmployeesOffline extends EmployeesEvent{
  final List<Employee> employees;
  const LoadEmployeesOffline({this.employees = const <Employee>[]});

  @override
  List<Object?> get props => [employees];

}

class LoadEmployeesOnline extends EmployeesEvent{
  final List<Employee> employees;
  const LoadEmployeesOnline({this.employees = const <Employee>[]});

  @override
  List<Object?> get props => [employees];

}