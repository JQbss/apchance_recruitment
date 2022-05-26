import 'package:apchance_recruitment/blocs/connect/connect_bloc.dart';
import 'package:apchance_recruitment/blocs/employees/employees_bloc.dart';
import 'package:apchance_recruitment/main.dart';
import 'package:apchance_recruitment/screens/home_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider<ConnectBloc>(
            create: (context) => ConnectBloc()
        ),
        BlocProvider<EmployeesBloc>(
          create: (context) =>
              EmployeesBloc(objectBoxRepository.employees, context.read<ConnectBloc>())
        ),
      ],
      child: MaterialApp(
        title: "List of employees"
            "",
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            primaryColor: const Color(0xff1D0259),
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
              color: const Color(0xffE7DFF2),
              child: AlertDialog(
                title: const Text(
                  "Connection Lost",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1D0259),
                    fontSize: 20.0,
                  ),
                ),
                content: const Text(
                  "You lost connection with network. If you want to continue with stored data press \"continue\". You can also press \"check\" to check connection.",
                  textAlign: TextAlign.justify,
                ),
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
