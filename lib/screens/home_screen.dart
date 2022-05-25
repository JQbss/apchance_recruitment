import 'package:apchance_recruitment/blocs/connect/connect_bloc.dart';
import 'package:apchance_recruitment/blocs/employees/employees_bloc.dart';
import 'package:apchance_recruitment/widgets/banner_widget.dart';
import 'package:apchance_recruitment/widgets/emplyee_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE7DFF2),
        body: BlocListener<ConnectBloc, ConnectState>(
          listener: (context, state) {
            if(state is ConnectionSuccess){
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("You are online! Welcome back!"))
              );
            }
          },
          child: BlocBuilder<EmployeesBloc, EmployeesState>(
            builder: (context, state) {
              if (state is EmployeesLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is EmployeesLoaded) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const BannerWidget(image: 'assets/undraw_flutter_dev_wvqj.png',title: "List of employees"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.employees.length,
                          itemBuilder: (BuildContext context, int index) {
                            return EmployeeCard(
                                context: context, employee: state.employees[index]);
                          }
                        ),
                      ),
                    ],
                  ),
                );
              }
              else {
                return const Center(child: Text("Something gone wrong"));
              }
            },
          ),
        ),
      ),
    );
  }
}
