import 'package:apchance_recruitment/blocs/cities/cities_bloc.dart';
import 'package:apchance_recruitment/repositories/city_repository.dart';
import 'package:apchance_recruitment/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//https://color.adobe.com/pl/search?q=city&t=term

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CityRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
              CitiesBloc(RepositoryProvider.of<CityRepository>(context),
              )..add(const LoadCities()
            )
          ),
        ],
        child: MaterialApp(
          title: "List of cities",
          theme: ThemeData(
              primarySwatch: Colors.indigo,
              primaryColor: const Color(0xff732929),
              appBarTheme: const AppBarTheme(
                  color: Color(0xffF2AB9B)
              )
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
