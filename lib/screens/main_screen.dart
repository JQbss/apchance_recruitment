import 'package:apchance_recruitment/blocs/cities/cities_bloc.dart';
import 'package:apchance_recruitment/blocs/connect/connect_bloc.dart';
import 'package:apchance_recruitment/main.dart';
import 'package:apchance_recruitment/screens/home_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


//https://color.adobe.com/pl/search?q=city&t=term

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider<ConnectBloc>(
            create: (context) => ConnectBloc()
        ),
        BlocProvider<CitiesBloc>(
          create: (context) =>
            CitiesBloc(objectBoxRepository.cities, context.read<ConnectBloc>())
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
        home: BlocConsumer<ConnectBloc,ConnectState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if(state is ConnectionSuccess || state is ConnectionOffline){
              return const HomeScreen();
            }

            return Container(
              color: Colors.white70,
              child: AlertDialog(
                title: const Text("Connection Lost"),
                content: const Text("You lost connection with network. If you want to continue with stored data press \"continue\"."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Connectivity().checkConnectivity().then((result) {
                          if(result == ConnectivityResult.mobile ||
                              result == ConnectivityResult.wifi){
                            context.read<ConnectBloc>().add(OnConnectedEvent());
                          }
                        });
                      },
                      child: const Text("Check")
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<ConnectBloc>().add(OnOfflineConnectedEvent());
                      },
                      child: const Text("Continue")
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
