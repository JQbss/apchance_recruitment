import 'package:apchance_recruitment/models/employees_model.dart';
import 'package:apchance_recruitment/widgets/emplyee_details_widget.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final BuildContext context;
  final Employee employee;
  const EmployeeCard({Key? key, required this.context, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetailsWidget(employee: employee)));
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
                  Image.network(
                      employee.avatar,
                    width: 50,
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    child: Text(employee.firstName)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
