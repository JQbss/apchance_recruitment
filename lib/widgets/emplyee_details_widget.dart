import 'package:apchance_recruitment/models/employees_model.dart';
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
            Text(employee.firstName)
          ],
        ),
      ),
    );
  }
}
