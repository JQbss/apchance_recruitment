import 'package:apchance_recruitment/repositories/object_box_repository.dart';
import 'package:apchance_recruitment/screens/main_screen.dart';
import 'package:flutter/material.dart';

late ObjectBoxRepository objectBoxRepository;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  objectBoxRepository = await ObjectBoxRepository.create();
  runApp(const MainScreen());
}