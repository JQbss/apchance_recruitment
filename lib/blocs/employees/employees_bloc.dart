import 'dart:async';

import 'package:apchance_recruitment/blocs/connect/connect_bloc.dart';
import 'package:apchance_recruitment/models/employees_model.dart';
import 'package:apchance_recruitment/repositories/employee_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final ConnectBloc connectBloc;
  final EmployeeRepository _employeeRepository;
  StreamSubscription? connectionSubscription;

  EmployeesBloc(this._employeeRepository,this.connectBloc)
      : super(EmployeesLoading()) {
    on<LoadingEmployees>(_onLoadingEmployees);
    on<LoadEmployeesOnline>(_onLoadEmployeesOnline);
    on<LoadEmployeesOffline>(_onLoadEmployeesOffline);
    listenConnectivity();
  }

  void _onLoadingEmployees(LoadingEmployees event,
      Emitter<EmployeesState> emit) {
    emit(
        const EmployeesLoaded()
    );
  }

  void _onLoadEmployeesOnline(LoadEmployeesOnline event,
      Emitter<EmployeesState> emit) async {
    final List<Employee> employees = await _employeeRepository
        .getEmployeesOnline();
    emit(
        EmployeesLoaded(employees: employees)
    );
  }

  void _onLoadEmployeesOffline(LoadEmployeesOffline event,
    Emitter<EmployeesState> emit) {
    final List<Employee> employees = _employeeRepository.getEmployeesOffline();
    emit(
        EmployeesLoaded(employees: employees)
    );
  }
  void listenConnectivity() {
    if (connectBloc.state is ConnectionSuccess) {
      add(const LoadEmployeesOnline());
    } else {
      add(const LoadEmployeesOffline());
    }
    connectionSubscription = connectBloc.stream.listen((state) {
      if (state is ConnectionSuccess) {
        add(const LoadEmployeesOnline());
      } else if (state is ConnectionOffline) {
        add(const LoadEmployeesOffline());
      }
    });
  }
}
