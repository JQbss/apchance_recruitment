import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Employee extends Equatable{
  int? id;
  String firstName;
  final String lastName;
  final String description;
  final String avatar;
  final String cityName;

  Employee({this.id,required this.firstName,required this.lastName,required this.description,required this.avatar, required this.cityName});

  @override
  List<Object?> get props =>[
    id,
    firstName,
    lastName,
    description,
    avatar,
    cityName
  ];

  Employee.fromJson(Map<dynamic,dynamic> json)
  : id = int.parse(json['id']),
    firstName = json['firstName'],
    lastName = json['lastName'],
    description = json['description'],
    avatar = json['avatar'],
    cityName = json['cityName'];

  Map<dynamic, dynamic> toJson() => <dynamic,dynamic>{
    'id':id.toString(),
    'firstName':firstName,
    'lastName':lastName,
    'description':description,
    'avatar':avatar,
    'cityName':cityName,
  };
}