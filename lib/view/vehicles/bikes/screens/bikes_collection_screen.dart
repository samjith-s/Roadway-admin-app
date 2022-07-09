import 'package:admin/application/internet/internet_cubit.dart';
import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/toast.dart';
import 'package:admin/view/vehicles/bikes/widgets/show_all_bike_gridview.dart';
import 'package:admin/view/vehicles/screens/add_new_vehicle_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class BikeCollectionScreen extends StatelessWidget {
  const BikeCollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Bikes Posted',
        ),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<VehiclesBloc>(context).add(
                const ChangeDropDownValues(type: 'Bike'),
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const AddNewVehicleScreen()),
                ),
              );
            },
            icon: const Icon(
              Icons.add_circle_outline,
              size: 25,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          children: [
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (!state.networkOn) {
                  showToast(
                    msg: "No network connection.Please check your connection",
                    bgcolor: kBlack,
                  );
                }
                return Container();
              },
            ),
            BlocBuilder<VehiclesBloc, VehiclesState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.isError) {
                  return Center(
                    child: Text(state.errorMsg),
                  );
                }
                return ShowAllBikeGridView(
                  state: state,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
