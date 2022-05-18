import 'package:apchance_recruitment/models/cities_model.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final BuildContext context;
  final City city;
  const CityCard({Key? key, required this.context, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              child: Text(city.name)
            )
          ],
        ),
      ),
    );
  }
}
