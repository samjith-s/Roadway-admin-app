import 'package:admin/core/constants/colors.dart';
import 'package:admin/domain/vehicles/models/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleGridViewItemWidget extends StatelessWidget {
  const VehicleGridViewItemWidget({
    Key? key,
    required this.vehicle,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final Vehicle vehicle;
  final int index;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: const BoxDecoration(
            color: kBlack, //Color.fromARGB(255, 237, 150, 21), //Color(0xFF22262c),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image(
                    image: NetworkImage(
                      vehicle.images[0],
                    ),
                    fit: BoxFit.fitHeight,
                    errorBuilder: (BuildContext c, Object o, StackTrace? s) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: kBlack,
                        ),
                        height: constraints.maxHeight * .55,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * .47,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 15,
                        bottom: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vehicle.brand,
                                style: GoogleFonts.roboto(fontSize: 12, color: kGray, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                vehicle.model,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.nunito(
                                  fontSize: 13,
                                  color: kWhite,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${vehicle.price >= 100 ? (vehicle.price / 100).round() : vehicle.price} ${vehicle.price >= 100 ? 'Cr' : 'Lac'}',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: kBlack,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
