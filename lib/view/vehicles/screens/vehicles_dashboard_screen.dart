import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/view/home/widgets/dashboard_item.dart';
import 'package:admin/view/vehicles/bikes/screens/bikes_collection_screen.dart';
import 'package:admin/view/vehicles/cars/screens/cars_collection_screen.dart';
import 'package:admin/view/vehicles/screens/show_brands_screen.dart';
import 'package:admin/view/vehicles/widgets/bodytype_bottom_sheet.dart';
import 'package:admin/view/vehicles/widgets/segments_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleSectionDashBoard extends StatelessWidget {
  const VehicleSectionDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<VehiclesBloc>(context).add(const GetSegments());
      BlocProvider.of<VehiclesBloc>(context).add(const GetBodyTypes());
      BlocProvider.of<VehiclesBloc>(context).add(const GetAllBrands());
      BlocProvider.of<VehiclesBloc>(context).add(const GetAllVehicles());
    });
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 215, 224, 228),
      appBar: AppBar(
        title: const Text(
          'Vehicles',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Wrap(
                children: [
                  DashBoardScreenItemWidget(
                    itemIcon: Icons.time_to_leave,
                    itemLabel: 'Cars',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const CarsCollectionScreen()),
                        ),
                      );
                    },
                  ),
                  DashBoardScreenItemWidget(
                    itemIcon: Icons.motorcycle,
                    itemLabel: 'Bikes',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const BikeCollectionScreen()),
                        ),
                      );
                    },
                  ),
                  DashBoardScreenItemWidget(
                    itemIcon: Icons.segment,
                    itemLabel: 'Segments',
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          context: context,
                          builder: (context) {
                            return const SegmentsListingBottomSheet();
                          });
                    },
                  ),
                  DashBoardScreenItemWidget(
                    itemIcon: Icons.title,
                    itemLabel: 'Brands',
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const ShowCarBrandsScreen(),
                        ),
                      );
                    },
                  ),
                  DashBoardScreenItemWidget(
                    itemIcon: Icons.menu,
                    itemLabel: 'Body Types',
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return const BodyTypesListingBottomSheet();
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
