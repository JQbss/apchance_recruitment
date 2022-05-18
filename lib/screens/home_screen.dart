import 'package:apchance_recruitment/blocs/cities/cities_bloc.dart';
import 'package:apchance_recruitment/widgets/city_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CitiesBloc,CitiesState>(
        builder: (context,state){
          if(state is CitiesLoading){
            return const CircularProgressIndicator();
          }
          if(state is CitiesLoaded){
            return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.cities.length,
                    itemBuilder: (BuildContext context, int index){
                      return CityCard(context: context, city: state.cities[index]);
                    }
            );
          }
          else{
            return const Text("Something gone wrong");
          }
        },
      ),
    );
  }
}
