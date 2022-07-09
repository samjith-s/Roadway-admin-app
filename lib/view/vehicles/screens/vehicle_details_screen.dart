import 'dart:developer';

import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/domain/vehicles/models/vehicle_model.dart';
import 'package:admin/view/vehicles/screens/add_new_vehicle_screen.dart';
import 'package:admin/view/vehicles/widgets/carousel_indicator.dart';
import 'package:admin/view/vehicles/widgets/delete_vehicle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoWVehicleDetialsScreen extends StatefulWidget {
  final int index;
  final bool isCar;
  const ShoWVehicleDetialsScreen({
    required this.index,
    required this.isCar,
    Key? key,
  }) : super(key: key);

  @override
  State<ShoWVehicleDetialsScreen> createState() => _ShoWVehicleDetialsScreenState();
}

class _ShoWVehicleDetialsScreenState extends State<ShoWVehicleDetialsScreen> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclesBloc, VehiclesState>(builder: (context, state) {
      List<String> vehicleFields = widget.isCar
          ? [
              state.availableCars[widget.index].manufactureYear,
              state.availableCars[widget.index].registrationYear,
              state.availableCars[widget.index].fuelType,
              state.availableCars[widget.index].color,
              state.availableCars[widget.index].ownerCount,
              state.availableCars[widget.index].mileage,
              state.availableCars[widget.index].kilometers,
              state.availableCars[widget.index].regPlace
            ]
          : [
              state.availableBikes[widget.index].manufactureYear,
              state.availableBikes[widget.index].registrationYear,
              state.availableBikes[widget.index].fuelType,
              state.availableBikes[widget.index].color,
              state.availableBikes[widget.index].ownerCount,
              state.availableBikes[widget.index].mileage,
              state.availableBikes[widget.index].kilometers,
              state.availableBikes[widget.index].regPlace
            ];
      Vehicle vehicle = widget.isCar ? state.availableCars[widget.index] : state.availableBikes[widget.index];

      log(vehicle.id.toString());
      return Scaffold(
        appBar: AppBar(
          //backgroundColor: kWhite,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: kBlack,
          ),
          title: const Text(
            'Details',
          ),
          centerTitle: true,
          actions: [
            DeleteVehicleButton(vehicle: vehicle),
          ],
        ),
        body: Column(
          children: [
            Container(
              //margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
              color: kBlack,
              child: Stack(
                children: [
                  PageView.builder(
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .3,
                        child: Image.network(
                          vehicle.images[index],
                          errorBuilder: (context, error, stackTrace) => Image.asset(
                            'lib/core/assets/images/imageNotFound.jpg',
                          ),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .3,
                        ),
                      );
                    }),
                    itemCount: vehicle.images.length,
                    controller: _controller,
                  ),
                  CarouselIndicatorWidget(
                    controller: _controller,
                    count: vehicle.images.length,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vehicle.brand,
                        style: GoogleFonts.roboto(
                          fontSize: 17,
                          color: darkGrey,
                        ),
                      ),
                      Text(
                        vehicle.model,
                        style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .06,
                    decoration: BoxDecoration(
                      color: kGreen,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '₹ ${vehicle.price >= 100 ? (vehicle.price / 100).round() : vehicle.price} ${vehicle.price >= 100 ? 'Cr' : 'Lac'}',
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: SizedBox(
                height: 105,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: kWhite.withOpacity(.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      //width: (MediaQuery.of(context).size.width - 45) / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image(
                            image: AssetImage(iconsList[index]),
                            width: 25,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            vehicleFields[index],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            propertiesList[index],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: kBlack.withOpacity(.5),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemCount: 8,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 50,
              margin: const EdgeInsets.only(right: 15, left: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kWhite,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddNewVehicleScreen(
                        isCar: widget.isCar,
                        vehilceToUpdate: vehicle,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Edit Details',
                  style: GoogleFonts.poppins(
                    fontSize: 21,
                    color: kBlack,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      );
    });
  }
}

List<String> iconsList = [
  'lib/core/assets/images/Registration-Icon.png',
  'lib/core/assets/images/Manufacture-Icon-new.png',
  'lib/core/assets/images/Fuel-Icon.png',
  'lib/core/assets/images/Color-Icon.png',
  'lib/core/assets/images/Man-Icon.png',
  'lib/core/assets/images/Mileage-Icon.png',
  'lib/core/assets/images/Kilometer-Icon.png',
  'lib/core/assets/images/Registration-Icon.png',
];
List<String> propertiesList = [
  'MFG YEAR',
  'REG YEAR',
  'FUEL TYPE',
  'COLOR',
  'OWNER',
  'MILEAGE',
  'KILOMETERS',
  'REG PLACE',
];
