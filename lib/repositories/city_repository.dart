import 'dart:convert';

import 'package:apchance_recruitment/models/cities_model.dart';
import 'package:apchance_recruitment/repositories/interfaces/i_city_repository.dart';
import 'package:http/http.dart' as http;
import 'package:objectbox/objectbox.dart';

class CityRepository implements ICityRepository{
  final String _baseUrl = "https://62851f403060bbd3474521fb.mockapi.io/cities";
  final Store _store;
  final Box<City> _box;

  CityRepository(this._store) : _box = _store.box();

  @override
  Future<List<City>> getCities() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if(response.statusCode == 200){
      final resultJson = json.decode(response.body).cast<Map<String,dynamic>>();
      final result = resultJson.map<City>((json)=>City.fromJson(resultJson)).toList();
      _box.putMany(result);
      return result;
    }else{
      throw Exception("Failed to load cities");
    }
  }

}