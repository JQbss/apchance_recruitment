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
    
    final response = await http.get(Uri.parse(_baseUrl));
    if(response.statusCode == 200){
      final resultJson = json.decode(response.body).cast<Map<String,dynamic>>();
      final List<Employee> result = resultJson.map<Employee>((json)=>Employee.fromJson(json)).toList();
      final List<Employee> res2 = resultJson.map<Employee>((json)=>Employee.fromJson(json)).toList();
      addToLocal(List.from(res2));
      return result;
    }else{
      throw Exception("Failed to load cities");
    }
  }

  @override
  List<Employee> getEmployeesOffline() {
    return _box.getAll();
  }

  void addToLocal(List<Employee> result)async{
    _box.removeAll();
    for(int i=0; i<result.length;i++){
      result[i].id=null;
      result[i].firstName="OFF "+result[i].firstName + " OFF";
      await _box.putAsync(result[i]);
    }
  }
}