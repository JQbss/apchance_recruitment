import 'dart:convert';

import 'package:apchance_recruitment/models/employees_model.dart';
import 'package:apchance_recruitment/repositories/interfaces/i_emplyee_repository.dart';
import 'package:http/http.dart' as http;
import 'package:objectbox/objectbox.dart';

class EmployeeRepository implements IEmployeeRepository{
  final String _baseUrl = "https://62851f403060bbd3474521fb.mockapi.io/employees";
  final Store _store;
  final Box<Employee> _box;

  EmployeeRepository(this._store) : _box = _store.box();

  @override
  Future<List<Employee>> getEmployeesOnline() async {
    try{
      final response = await http.get(Uri.parse(_baseUrl));
      if(response.statusCode == 200){
        final resultJson = json.decode(response.body).cast<Map<String,dynamic>>();
        final List<Employee> result = resultJson.map<Employee>((json)=>Employee.fromJson(json)).toList();
        addToLocal([...result]);
        return result;
      }else if(response.statusCode == 500){
        throw Exception("Server not responding");
      }else{
        throw Exception("Error occurred during loading data");
      }
    }on Exception{
      throw Exception("Error occurred during downloading data");
    }

  }

  @override
  List<Employee> getEmployeesOffline() {
    try{
      return _box.getAll();
    }on Exception{
      throw Exception("Error occurred during getting data from local database");
    }
  }

  void addToLocal(List<Employee> result)async{
    try {
      _box.removeAll();
      for (int i = 0; i < result.length; i++) {
        result[i].id = null;
        await _box.putAsync(result[i]);
      }
    } on Exception {
      throw Exception("Error occurred during save sata to local database");
    }
  }
}