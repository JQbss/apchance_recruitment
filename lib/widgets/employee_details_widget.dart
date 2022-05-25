import 'package:apchance_recruitment/models/employees_model.dart';
import 'package:apchance_recruitment/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsWidget extends StatelessWidget {
  final Employee employee;
  const EmployeeDetailsWidget({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const BannerWidget(image: 'assets/undraw_feeling_proud_qne1.png',title: "Employee details"),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70.0),
                                    child: Image.network(
                                      employee.avatar
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Text(
                                      employee.firstName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1D0259),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    employee.lastName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1D0259),
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],

                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child:
                                    Text(
                                      employee.description,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        color: Color(0xff1D0259),
                                        fontSize: 15.0,
                                      ),
                                    ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
