import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/domain/vehicles/models/vehicle_model.dart';
import 'package:admin/view/vehicles/cars/widgets/single_vehicle_grid_item.dart';
import 'package:admin/view/vehicles/screens/vehicle_details_screen.dart';
import 'package:flutter/material.dart';

class ShowAllBikeGridView extends StatelessWidget {
  const ShowAllBikeGridView({
    Key? key,
    required this.state,
  }) : super(key: key);
  final VehiclesState state;

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
          Vehicle bike = state.availableBikes[index];
          return VehicleGridViewItemWidget(
            vehicle: bike,
            index: index,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => ShoWVehicleDetialsScreen(
                        isCar: false,
                        index: index,
                      )),
                ),
              );
            },
          );
        },
        itemCount: state.availableBikes.length,
      ),
    );
  }
}
