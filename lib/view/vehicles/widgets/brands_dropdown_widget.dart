import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandDropDownWidget extends StatelessWidget {
  const BrandDropDownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 4,
            bottom: 4,
          ),
          child: Text(
            'MAKE',
            style: GoogleFonts.abel(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width - 40) / 2,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(5),
          ),
          child: BlocBuilder<VehiclesBloc, VehiclesState>(
            builder: (context, state) {
              return DropdownButton(
                isExpanded: true,
                icon: const SizedBox(
                  width: 15,
                  height: 25,
                  child: Icon(
                    Icons.arrow_drop_down,
                  ),
                ),
                value: state.vehicleMakeDropdownValue,
                underline: const SizedBox(
                  height: 0,
                ),
                hint: Text(
                  'MAKE',
                  style: GoogleFonts.roboto(fontSize: 12),
                ),
                items: List.generate(state.brandsList.length, ((index) {
                  return DropdownMenuItem(
                    value: state.brandsList[index].name,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            state.brandsList[index].imagePath,
                            height: 15,
                            width: 15,
                            errorBuilder: (BuildContext ctx, object, StackTrace? _) {
                              return const SizedBox();
                            },
                          ),
                        ),
                        const SizedBox(width: 6),
                        SizedBox(
                          width: ((MediaQuery.of(context).size.width - 40) / 2) - 60,
                          child: Text(
                            state.brandsList[index].name,
                          ),
                        ),
                      ],
                    ),
                  );
                })),
                onChanged: (value) {
                  BlocProvider.of<VehiclesBloc>(context)
                      .add(ChangeVehicleMakeDropdownValue(newValue: value.toString()));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
