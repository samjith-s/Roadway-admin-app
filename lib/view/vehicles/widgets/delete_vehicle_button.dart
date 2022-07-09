import 'package:admin/application/internet/internet_cubit.dart';
import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/toast.dart';
import 'package:admin/domain/vehicles/models/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteVehicleButton extends StatelessWidget {
  const DeleteVehicleButton({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: const EdgeInsets.all(15),
            backgroundColor: alertColor,
            content: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Are you Sure?',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'This vehicle details will be deleted permenantly.',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'No',
                          style: GoogleFonts.hind(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      BlocBuilder<InternetCubit, InternetState>(
                        builder: (context, state) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              if (state.networkOn) {
                                BlocProvider.of<VehiclesBloc>(context).add(
                                  DeleteVehicle(id: vehicle.id!),
                                );
                                showToast(
                                  msg: "Item deleted successfuly",
                                  bgcolor: Colors.red, // message
                                );
                              } else {
                                showToast(
                                  msg:
                                      "No network connection.Please enable network to continue", // message
                                  bgcolor: kBlack,
                                );
                              }

                              int count = 0;
                              Navigator.of(context)
                                  .popUntil((_) => count++ >= 2);
                            },
                            child: Text(
                              'Yes',
                              style: GoogleFonts.hind(
                                color: Colors.red,
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.delete_forever_sharp,
        color: Colors.red,
      ),
    );
  }
}
