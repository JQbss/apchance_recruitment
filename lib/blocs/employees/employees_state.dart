part of 'employees_bloc.dart';

abstract class EmployeesState extends Equatable {
  const EmployeesState();
}

class EmployeesLoading extends EmployeesState {
  @override
  List<Object> get props => [];
}

class EmployeesLoaded extends EmployeesState{
  final List<Employee> employees;
  const EmployeesLoaded({this.employees = const <Employee>[]});

  @override
  List<Object> get props => [employees];
}
