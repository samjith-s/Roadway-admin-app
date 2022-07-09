import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:admin/application/internet/internet_cubit.dart';
import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/toast.dart';
import 'package:admin/domain/vehicles/models/vehicle_model.dart';
import 'package:admin/view/vehicles/widgets/addscreen_custom_dropdown_widget.dart';
import 'package:admin/view/vehicles/widgets/addscreen_textfield_widget.dart';
import 'package:admin/view/vehicles/widgets/brands_dropdown_widget.dart';
import 'package:admin/view/vehicles/widgets/year_picker_add_screen_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

late TextEditingController modelController;
late TextEditingController priceController;
late TextEditingController colorController;
late TextEditingController ownerController;
late TextEditingController mileageController;
late TextEditingController kiloMeterController;
late TextEditingController regPlaceController;

class AddNewVehicleScreen extends StatefulWidget {
  final Vehicle? vehilceToUpdate;
  final bool? isCar;
  const AddNewVehicleScreen({
    this.vehilceToUpdate,
    this.isCar,
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewVehicleScreen> createState() => _AddNewVehicleScreenState();
}

class _AddNewVehicleScreenState extends State<AddNewVehicleScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    modelController = TextEditingController();
    priceController = TextEditingController();
    colorController = TextEditingController();
    ownerController = TextEditingController();
    mileageController = TextEditingController();
    kiloMeterController = TextEditingController();
    regPlaceController = TextEditingController();
  }

  @override
  void dispose() {
    modelController.dispose();
    priceController.dispose();
    colorController.dispose();
    ownerController.dispose();
    mileageController.dispose();
    kiloMeterController.dispose();
    regPlaceController.dispose();
    super.dispose();
  }

  List<String> _imageFireUrls = [];

  @override
  Widget build(BuildContext context) {
    if (widget.vehilceToUpdate != null) {
      changeFieldDefaultValues(context);
      //BlocProvider.of<VehiclesBloc>(context).add(Change);
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.vehilceToUpdate != null ? 'Update' : 'New Vehicle',
          //style: GoogleFonts.abel(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          BlocProvider.of<VehiclesBloc>(context).add(const GetSegments());
          BlocProvider.of<VehiclesBloc>(context).add(const GetBodyTypes());
          BlocProvider.of<VehiclesBloc>(context).add(
            const AddPickedImages(pickedImages: []),
          );
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<VehiclesBloc, VehiclesState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      //   color: const Color.fromARGB(255, 214, 218, 220),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () async {
                              List<XFile>? images = await ImagePicker().pickMultiImage();
                              if (images != null && images.isNotEmpty) {
                                BlocProvider.of<VehiclesBloc>(context).add(
                                  ChangeUploadImageProgress(newValue: 0),
                                );
                                BlocProvider.of<VehiclesBloc>(context).add(
                                  AddPickedImages(pickedImages: images),
                                );
                                showImageUploadingProgressPopUp(context);
                                _imageFireUrls = await uploadImage(images);
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * .15,
                              height: MediaQuery.of(context).size.width * .15,
                              decoration: BoxDecoration(
                                color: kYellow,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.image_outlined,
                              ),
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Select maximum five images'),
                          ),
                          ////Listview to display the picked images

                          SizedBox(
                            height: MediaQuery.of(context).size.width * .15,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: MediaQuery.of(context).size.width * .15,
                                  height: MediaQuery.of(context).size.width * .15,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: state.pickedImages!.isEmpty
                                          ? NetworkImage(_imageFireUrls[index])
                                          : FileImage(File(state.pickedImages![index].path)) as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                    //color: kYellow,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, _) {
                                var space = size.width - (size.width * .75);
                                return SizedBox(width: (space - 30) / 4);
                              },
                              itemCount:
                                  state.pickedImages!.isEmpty ? _imageFireUrls.length : state.pickedImages!.length,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              AddScreenCustomDropDownWidget(
                                dropDownValue: state.vehicleTypeDropdownValue,
                                title: 'CAR OR BIKE',
                                itemList: const ['Car', 'Bike'],
                                onChanged: (value) {
                                  BlocProvider.of<VehiclesBloc>(context)
                                      .add(ChangeVehicleTypeDropdownValue(newValue: value!));
                                },
                                onTapFunctions: [
                                  () {
                                    BlocProvider.of<VehiclesBloc>(context).add(const GetSegments());
                                    BlocProvider.of<VehiclesBloc>(context).add(const GetBodyTypes());

                                    BlocProvider.of<VehiclesBloc>(context).add(
                                      const ChangeDropDownValues(type: 'Car'),
                                    );
                                  },
                                  () {
                                    BlocProvider.of<VehiclesBloc>(context).add(
                                      const ChangeDropDownValues(type: 'Bike'),
                                    );
                                    BlocProvider.of<VehiclesBloc>(context).add(const GetSegments());
                                    BlocProvider.of<VehiclesBloc>(context).add(const GetBodyTypes());
                                  },
                                ],
                              ),
                              const SizedBox(width: 10),
                              const BrandDropDownWidget(),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: AddVehicleTextfieldWidget(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: modelController,
                                  labelText: 'MODEL',
                                ),
                              ),
                              const SizedBox(width: 10),
                              AddScreenCustomDropDownWidget(
                                dropDownValue: state.vehicleSegmentsDropdownValue,
                                //itemList: state.segmentsList,
                                itemList: state.segmentsList.map((e) => e.segmentName).toList(),
                                onChanged: (value) {
                                  BlocProvider.of<VehiclesBloc>(context)
                                      .add(ChangeVehicleSegmentsDropdownValue(newValue: value!));
                                },
                                title: 'SEGMENT',
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              AddScreenCustomDropDownWidget(
                                dropDownValue: state.vehicleBodyTypesDropdownValue,
                                title: 'BODY TYPE',
                                //itemList: state.bodyTypesList,
                                itemList: state.bodyTypesList.map((e) => e.type).toList(),
                                onChanged: (value) {
                                  BlocProvider.of<VehiclesBloc>(context)
                                      .add(ChangeVehicleBodytypeDropdownValue(newValue: value!));
                                },
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: AddVehicleTextfieldWidget(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  labelText: 'PRICE',
                                  controller: priceController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AddCarYearPicker(
                                selectedDate: state.manufactureYear,
                                hintText: 'MFG YEAR',
                                onChanged: ({DateTime? newDate}) {
                                  BlocProvider.of<VehiclesBloc>(context).add(ChangeManufactureYear(newDate: newDate!));
                                },
                              ),
                              const SizedBox(width: 10),
                              AddCarYearPicker(
                                selectedDate: state.registrationYear,
                                hintText: 'REG YEAR',
                                onChanged: ({DateTime? newDate}) {
                                  BlocProvider.of<VehiclesBloc>(context).add(ChangeRegistrationYear(newDate: newDate!));
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              AddScreenCustomDropDownWidget(
                                dropDownValue: state.vehicleFuelDropdownValue,
                                title: 'FUEL TYPE',
                                itemList: fuelTypes,
                                // childList: fuelTypes,
                                onChanged: (value) {
                                  BlocProvider.of<VehiclesBloc>(context)
                                      .add(ChangeVehicleFuelDropdownValue(newValue: value!));
                                },
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: AddVehicleTextfieldWidget(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  labelText: 'COLOR',
                                  controller: colorController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: AddVehicleTextfieldWidget(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  labelText: 'OWNER',
                                  controller: ownerController,
                                  keyBoardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: AddVehicleTextfieldWidget(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  labelText: 'MILEAGE',
                                  controller: mileageController,
                                  keyBoardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: AddVehicleTextfieldWidget(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  labelText: 'kILOMETERS',
                                  controller: kiloMeterController,
                                  keyBoardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width - 40) / 2,
                                child: AddVehicleTextfieldWidget(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  labelText: 'REG PLACE',
                                  controller: regPlaceController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          BlocBuilder<InternetCubit, InternetState>(
                            builder: (context, netstate) {
                              return SizedBox(
                                height: 48,
                                width: MediaQuery.of(context).size.width - 30,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: kYellow,
                                  ),
                                  onPressed: () async {
                                    if (!netstate.networkOn) {
                                      showToast(
                                        msg: "No network connection.Please check your connection", // message
                                        bgcolor: kBlack,
                                      );
                                      return;
                                    }

                                    if (widget.vehilceToUpdate == null) {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }
                                      if (_imageFireUrls.isEmpty) {
                                        log('sdlfkjskldjfl');
                                        return;
                                      }

                                      Vehicle vehicle = Vehicle(
                                        images: _imageFireUrls,
                                        type: state.vehicleTypeDropdownValue!,
                                        brand: state.vehicleMakeDropdownValue!,
                                        model: modelController.text.trim().toUpperCase(),
                                        segment: state.vehicleSegmentsDropdownValue!,
                                        bodyType: state.vehicleBodyTypesDropdownValue!,
                                        price: double.tryParse(priceController.text.trim()) ?? 0,
                                        manufactureYear: state.manufactureYear.year.toString(),
                                        registrationYear: state.registrationYear.year.toString(),
                                        fuelType: state.vehicleFuelDropdownValue!,
                                        color: colorController.text.trim(),
                                        ownerCount: ownerController.text.trim(),
                                        mileage: mileageController.text.trim(),
                                        kilometers: kiloMeterController.text.trim(),
                                        regPlace: regPlaceController.text.trim().toUpperCase(),
                                      );

                                      BlocProvider.of<VehiclesBloc>(context).add(
                                        AddNewVehicleToDatabase(
                                          newVehicle: vehicle,
                                        ),
                                      );
                                      BlocProvider.of<VehiclesBloc>(context).add(const GetSegments());
                                      BlocProvider.of<VehiclesBloc>(context).add(const GetBodyTypes());
                                      BlocProvider.of<VehiclesBloc>(context).add(
                                        const AddPickedImages(pickedImages: []),
                                      );
                                      Timer(
                                        const Duration(seconds: 1),
                                        () => showToast(
                                          bgcolor: ksuccess,
                                          msg: "Vehicle added successfully", // message
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                    } else {
                                      Vehicle updatedVehicle = Vehicle(
                                        images: _imageFireUrls,
                                        type: state.vehicleTypeDropdownValue!,
                                        brand: state.vehicleMakeDropdownValue!,
                                        model: modelController.text.trim().toUpperCase(),
                                        segment: state.vehicleSegmentsDropdownValue!,
                                        bodyType: state.vehicleBodyTypesDropdownValue!,
                                        price: double.tryParse(priceController.text.trim()) ?? 0,
                                        manufactureYear: state.manufactureYear.year.toString(),
                                        registrationYear: state.registrationYear.year.toString(),
                                        fuelType: state.vehicleFuelDropdownValue!,
                                        color: colorController.text.trim(),
                                        ownerCount: ownerController.text.trim(),
                                        mileage: mileageController.text.trim(),
                                        kilometers: kiloMeterController.text.trim(),
                                        regPlace: regPlaceController.text.trim().toUpperCase(),
                                        id: widget.vehilceToUpdate!.id,
                                      );

                                      BlocProvider.of<VehiclesBloc>(context).add(UpdateVehicle(
                                        updatedVehicle: updatedVehicle,
                                        id: widget.vehilceToUpdate!.id!,
                                      ));
                                      BlocProvider.of<VehiclesBloc>(context).add(
                                        const AddPickedImages(pickedImages: []),
                                      );
                                      Timer(
                                        const Duration(seconds: 1),
                                        () => showToast(
                                          bgcolor: ksuccess,
                                          msg: "Vehicle updated successfully", // message
                                        ),
                                      );

                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: Text(
                                    widget.vehilceToUpdate == null ? 'Add' : 'Update',
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }

  Future<dynamic> showImageUploadingProgressPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: alertColor,
            contentPadding: const EdgeInsets.all(15),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<VehiclesBloc, VehiclesState>(
                  builder: (context, state) {
                    if (state.uploadImageProgress == 1) {
                      Navigator.of(ctx).pop();
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: kGreen,
                        value: state.uploadImageProgress,
                      ),
                    );
                  },
                ),
                const Text('Uploading Images')
              ],
            ),
          );
        });
  }

  void changeFieldDefaultValues(BuildContext context) {
    modelController.text = widget.vehilceToUpdate!.model;
    priceController.text = widget.vehilceToUpdate!.price.toString();
    colorController.text = widget.vehilceToUpdate!.color;
    ownerController.text = widget.vehilceToUpdate!.ownerCount;
    mileageController.text = widget.vehilceToUpdate!.mileage;
    kiloMeterController.text = widget.vehilceToUpdate!.kilometers;
    regPlaceController.text = widget.vehilceToUpdate!.regPlace;

    BlocProvider.of<VehiclesBloc>(context).add(ChangeVehicleMakeDropdownValue(newValue: widget.vehilceToUpdate!.brand));
    //}
    BlocProvider.of<VehiclesBloc>(context).add(ChangeVehicleTypeDropdownValue(newValue: widget.vehilceToUpdate!.type));
    BlocProvider.of<VehiclesBloc>(context)
        .add(ChangeVehicleBodytypeDropdownValue(newValue: widget.vehilceToUpdate!.bodyType));
    BlocProvider.of<VehiclesBloc>(context)
        .add(ChangeVehicleFuelDropdownValue(newValue: widget.vehilceToUpdate!.fuelType));
    BlocProvider.of<VehiclesBloc>(context)
        .add(ChangeVehicleSegmentsDropdownValue(newValue: widget.vehilceToUpdate!.segment));
    BlocProvider.of<VehiclesBloc>(context).add(
      ChangeManufactureYear(
        newDate: DateTime(int.tryParse(widget.vehilceToUpdate!.manufactureYear) ?? DateTime.now().year),
      ),
    );
    BlocProvider.of<VehiclesBloc>(context).add(
      ChangeRegistrationYear(
        newDate: DateTime(int.tryParse(widget.vehilceToUpdate!.registrationYear) ?? DateTime.now().year),
      ),
    );
    _imageFireUrls = widget.vehilceToUpdate!.images.map((image) => image.toString()).toList();
  }

  Future<List<String>> uploadImage(List<XFile> images) async {
    int i = 1;
    List<String> imagesUrls = [];
    for (var image in images) {
      Reference storageReference = FirebaseStorage.instance.ref().child('vehicleImage/${image.path}');

      UploadTask uploadTask = storageReference.putFile(File(image.path));
      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      imagesUrls.add(await taskSnapshot.ref.getDownloadURL());

      BlocProvider.of<VehiclesBloc>(context).add(
        ChangeUploadImageProgress(newValue: i / images.length),
      );
      i++;
    }
    return imagesUrls;
  }
}

List<String> fuelTypes = [
  'Petrol',
  'Diesel',
  'Electric',
  'CNG',
  'LPG',
  'Hybrid',
];
