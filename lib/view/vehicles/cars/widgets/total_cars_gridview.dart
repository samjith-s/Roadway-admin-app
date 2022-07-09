import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/domain/vehicles/models/vehicle_model.dart';
import 'package:admin/view/vehicles/cars/widgets/single_vehicle_grid_item.dart';
import 'package:admin/view/vehicles/screens/vehicle_details_screen.dart';
import 'package:flutter/material.dart';

class ShowTotoalCarsGridView extends StatelessWidget {
  final VehiclesState state;
  const ShowTotoalCarsGridView({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: .8,
        ),
        itemBuilder: (context, index) {
          Vehicle car = state.availableCars[index];
          return VehicleGridViewItemWidget(
            vehicle: car,
            index: index,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => ShoWVehicleDetialsScreen(
                        isCar: true,
                        index: index,
                      )),
                ),
              );
            },
          );
        },
        itemCount: state.availableCars.length,
      ),
    );
  }
}
