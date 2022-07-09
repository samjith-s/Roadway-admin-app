import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/domain/vehicles/models/segment_model.dart';
import 'package:admin/view/vehicles/widgets/add_segment_alert_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SegmentsListingBottomSheet extends StatelessWidget {
  const SegmentsListingBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Segments',
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
                          return const AddSegmetAlertDialogue();
                        },
                      );
                    },
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            ),
            const Divider(),
            BlocBuilder<VehiclesBloc, VehiclesState>(
              builder: (context, state) {
                if (state.segmentsList.isEmpty) {
                  return Container();
                } else {
                  return Column(
                    children: List.generate(state.segmentsList.length, (index) {
                      Segment doc = state.segmentsList[index];

                      return Card(
                        child: ListTile(
                          title: Text(doc.segmentName),
                        ),
                      );
                    }),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
