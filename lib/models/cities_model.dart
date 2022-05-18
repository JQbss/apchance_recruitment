import 'package:equatable/equatable.dart';

class City extends Equatable{
  final String id;
  final String name;
  final String cityImage;
  final String description;
  final bool isRead;

  const City({required this.id,required this.name,required this.cityImage,required this.description,required this.isRead});

  @override
  List<Object?> get props =>[
    id,
    name,
    cityImage,
    description,
    isRead
  ];

  City.fromJson(Map<dynamic,dynamic> json)
  : id = json['id'],
    name = json['name'],
    cityImage = json['cityImage'],
    description = json['description'],
    isRead = json['isRead'];

  Map<dynamic, dynamic> toJson() => <dynamic,dynamic>{
    'id':id,
    'name':name,
    'cityImage':cityImage,
    'description':description,
    'isRead':isRead
  };
}