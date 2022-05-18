import 'dart:convert';

import 'package:apchance_recruitment/models/cities_model.dart';
import 'package:apchance_recruitment/repositories/interfaces/i_city_repository.dart';
import 'package:http/http.dart' as http;

class CityRepository implements ICityRepository{
  final String _baseUrl = "https://62851f403060bbd3474521fb.mockapi.io/cities";

  @override
  Future<List<City>> getCities() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if(response.statusCode == 200){
      final result = json.decode(response.body).cast<Map<String,dynamic>>();
      return result.map<City>((json)=>City.fromJson(json)).toList();
    }else{
      throw Exception("Failed to load cities");
    }
  }

}