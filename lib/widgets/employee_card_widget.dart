import 'package:apchance_recruitment/blocs/connect/connect_bloc.dart';
import 'package:apchance_recruitment/models/employees_model.dart';
import 'package:apchance_recruitment/widgets/employee_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeCard extends StatelessWidget {
  final BuildContext context;
  final Employee employee;

  const EmployeeCard({Key? key, required this.context, required this.employee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectBloc, ConnectState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  EmployeeDetailsWidget(employee: employee)));
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if(state is ConnectionSuccess)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35.0),
                            child: Image.network(
                              employee.avatar,
                              width: 70,
                              height: 70,
                            ),
                          ),

                        if(state is ConnectionOffline)
                          const Icon(
                            Icons.image_not_supported,
                            size: 60,
                            color: Color(0xff1D0259),
                          ),


                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    employee.firstName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1D0259),
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      employee.lastName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1D0259),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 5.0),
                                      child: Icon(
                                        Icons.location_city,
                                        size: 17.0,
                                        color: Color(0xff6805F2),
                                      ),
                                    ),
                                    Text(
                                        employee.cityName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0,
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
