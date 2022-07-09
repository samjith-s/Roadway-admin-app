import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/domain/vehicles/models/body_types_model.dart';
import 'package:admin/view/vehicles/widgets/add_bodytype_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

ValueNotifier<VehicleType> groupValueNotifier = ValueNotifier(VehicleType.car);

class BodyTypesListingBottomSheet extends StatelessWidget {
  const BodyTypesListingBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Body Types',
                    style: GoogleFonts.abel(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AddBodyTypeAlertDialogWidget();
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            BlocBuilder<VehiclesBloc, VehiclesState>(
              builder: (context, state) {
                return Column(
                  children: List.generate(state.bodyTypesList.length, (indx) {
                    BodyType bodyType = state.bodyTypesList[indx];
                    return Card(
                      child: ListTile(
                        title: Text(bodyType.type),
                      ),
                    );
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

enum VehicleType { bike, car }
