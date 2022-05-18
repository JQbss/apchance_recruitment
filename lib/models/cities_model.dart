import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class City extends Equatable{
  int? id;
  final String name;
  final String cityImage;
  final String description;
  final bool isRead;

  City({this.id,required this.name,required this.cityImage,required this.description,required this.isRead});

  @override
  List<Object?> get props =>[
    id,
    name,
    cityImage,
    description,
    isRead
  ];

  City.fromJson(Map<dynamic,dynamic> json)
  : id = int.parse(json['id']),
    name = json['name'],
    cityImage = json['cityImage'],
    description = json['description'],
    isRead = json['isRead'];

  Map<dynamic, dynamic> toJson() => <dynamic,dynamic>{
    'id':id.toString(),
    'name':name,
    'cityImage':cityImage,
    'description':description,
    'isRead':isRead
  };
}