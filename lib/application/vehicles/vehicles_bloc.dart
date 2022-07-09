import 'dart:async';
import 'dart:developer';

import 'package:admin/domain/vehicles/models/body_types_model.dart';
import 'package:admin/domain/vehicles/models/brand_medel.dart';
import 'package:admin/domain/vehicles/models/segment_model.dart';
import 'package:admin/domain/vehicles/models/vehicle_model.dart';
import 'package:admin/domain/vehicles/vehicle_services.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../view/vehicles/screens/add_new_vehicle_screen.dart';

part 'vehicles_event.dart';
part 'vehicles_state.dart';
part 'vehicles_bloc.freezed.dart';

@injectable
class VehiclesBloc extends Bloc<VehiclesEvent, VehiclesState> {
  final VehicleServices _vehicleServices;
  VehiclesBloc(this._vehicleServices) : super(VehiclesState.initial()) {
    on<AddSegment>((event, emit) async {
      try {
        CollectionReference segments = FirebaseFirestore.instance
            .collection('vehicles')
            .doc('vehiclesegments')
            .collection('segments');
        Segment segment =
            Segment(segmentName: event.segment, isCar: event.isCar);
        segments.add(segment.toJson()).then(
              (value) => value.update(
                {
                  "segmentId": value.id,
                },
              ),
            );
      } catch (e) {
        log('error');
      }
    });

    on<GetSegments>((event, emit) async {
      log('i dont have any idea');
      emit(state.copyWith(isLoading: true, isError: false, errorMsg: ''));
      Either<String, List<Segment>> segments =
          await _vehicleServices.getSegments();

      segments.fold((error) {
        Timer(const Duration(seconds: 3), () {
          emit(
              state.copyWith(isError: true, isLoading: false, errorMsg: error));
        });
      }, (r) {
        emit(state.copyWith(
            segmentsList: r, isError: false, isLoading: false, errorMsg: ''));
      });
    });

    on<AddBodyType>((event, emit) async {
      try {
        CollectionReference bodyTypes = FirebaseFirestore.instance
            .collection('vehicles')
            .doc('vehiclesbodytypes')
            .collection('bodytypes');
        BodyType bodyType = BodyType(type: event.bodyType, isCar: event.isCar);

        bodyTypes.add(bodyType.toJson()).then(
              (value) => value.update({"id": value.id}),
            );
      } catch (e) {
        log(e.toString());
      }
    });
///////////////////////////////////////////////////////////////////////////////////////
    on<GetBodyTypes>((event, emit) async {
      emit(state.copyWith(isLoading: true, isError: false, errorMsg: ''));
      Either<String, List<BodyType>> result =
          await _vehicleServices.getBodyTypes();

      result.fold(
        (error) => emit(
            state.copyWith(isError: true, isLoading: false, errorMsg: error)),
        (bodyTypes) => emit(state.copyWith(
          bodyTypesList: bodyTypes,
          isError: false,
          isLoading: false,
          errorMsg: '',
        )),
      );
    });
    on<AddBrands>((event, emit) async {
      try {
        CollectionReference brands = FirebaseFirestore.instance
            .collection('vehicles')
            .doc('vehiclesbrands')
            .collection('brands');
        brands.add(event.brand.toJson()).then(
              (value) => value.update({'brandId': value.id}).then(
                  (value) => add(const GetAllBrands())),
            );
      } catch (e) {
        log(e.toString());
      }

      //log(event.brand.imagePath);
    });
/////////////////////////////////////////////////////////////////////
    on<GetAllBrands>((event, emit) async {
      emit(state.copyWith(isLoading: true, isError: false, errorMsg: ''));
      Either<String, List<Brand>> result =
          await _vehicleServices.getAllBrands();
      result.fold(
        (error) => emit(
            state.copyWith(isError: true, isLoading: false, errorMsg: error)),
        (brands) => emit(state.copyWith(
          brandsList: brands,
          isError: false,
          isLoading: false,
          errorMsg: '',
        )),
      );
      // emit(state.copyWith(brandsList: brands));
    });
    on<DeleteBrand>((event, emit) async {
      try {
        FirebaseFirestore.instance
            .collection('vehicles')
            .doc('vehiclesbrands')
            .collection('brands')
            .doc(event.id)
            .delete();
      } catch (e) {
        log(e.toString());
      }
      add(const GetAllBrands());
    });

    on<ChangeVehicleTypeDropdownValue>((event, emit) {
      emit(state.copyWith(vehicleTypeDropdownValue: event.newValue));
    });
    on<ChangeVehicleMakeDropdownValue>((event, emit) {
      emit(state.copyWith(vehicleMakeDropdownValue: event.newValue));
    });
    on<ChangeVehicleSegmentsDropdownValue>((event, emit) {
      emit(state.copyWith(vehicleSegmentsDropdownValue: event.newValue));
    });
    on<ChangeVehicleBodytypeDropdownValue>((event, emit) {
      emit(state.copyWith(vehicleBodyTypesDropdownValue: event.newValue));
    });
    on<ChangeVehicleFuelDropdownValue>((event, emit) {
      emit(state.copyWith(vehicleFuelDropdownValue: event.newValue));
    });
    on<AddPickedImages>((event, emit) {
      emit(state.copyWith(pickedImages: event.pickedImages));
    });
    on<ChangeManufactureYear>((event, emit) {
      emit(state.copyWith(manufactureYear: event.newDate));
    });
    on<ChangeRegistrationYear>((event, emit) {
      emit(state.copyWith(registrationYear: event.newDate));
    });
    on<ChangeUploadImageProgress>((event, emit) {
      emit(state.copyWith(uploadImageProgress: event.newValue));
    });
    on<ChangeDropDownValues>((event, emit) {
      if (event.type == 'Car') {
        List<Segment> carSegments = state.segmentsList
            .where((element) => element.isCar == true)
            .toList();
        List<BodyType> carBodyTypes = state.bodyTypesList
            .where((element) => element.isCar == true)
            .toList();
        emit(state.copyWith(
          vehicleTypeDropdownValue: event.type,
          bodyTypesList: carBodyTypes,
          segmentsList: carSegments,
          vehicleFuelDropdownValue: fuelTypes[0],
          vehicleSegmentsDropdownValue: carSegments[0].segmentName,
          vehicleBodyTypesDropdownValue: carBodyTypes[0].type,
          vehicleMakeDropdownValue: state.brandsList[0].name,
        ));
      } else if (event.type == 'Bike') {
        List<Segment> bikeSegments = state.segmentsList
            .where((element) => element.isCar == false)
            .toList();
        List<BodyType> bikeBodyTypes = state.bodyTypesList
            .where((element) => element.isCar == false)
            .toList();

        emit(state.copyWith(
          vehicleTypeDropdownValue: event.type,
          bodyTypesList: bikeBodyTypes,
          segmentsList: bikeSegments,
          vehicleFuelDropdownValue: fuelTypes[0],
          vehicleSegmentsDropdownValue: bikeSegments[0].segmentName,
          vehicleBodyTypesDropdownValue: bikeBodyTypes[0].type,
          vehicleMakeDropdownValue: state.brandsList[0].name,
        ));
      }
    });

    on<AddNewVehicleToDatabase>(
      (event, emit) {
        try {
          CollectionReference vehicles =
              FirebaseFirestore.instance.collection('vehicles');

          vehicles
              .add(event.newVehicle.toJson())
              .then((value) => value.update({'id': value.id})
                  //.then((value) => add(const GetAllBrands())),
                  );
        } catch (e) {
          log(e.toString());
        }
        add(const GetAllVehicles());
      },
    );

    on<GetAllVehicles>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        isError: false,
        errorMsg: '',
      ));

      Either<String, List<Vehicle>> totalVehicles =
          await _vehicleServices.getAllVehicle();

      totalVehicles.fold((failure) {
        emit(state.copyWith(
          isError: true,
          isLoading: false,
          errorMsg: failure,
        ));
      }, (vehicles) {
        List<Vehicle> bikes =
            vehicles.where((element) => element.type == 'Bike').toList();
        List<Vehicle> cars =
            vehicles.where((element) => element.type == 'Car').toList();

        emit(
          state.copyWith(
            availableBikes: bikes,
            availableCars: cars,
            isError: false,
            isLoading: false,
            errorMsg: '',
          ),
        );
      });
    });

    on<DeleteVehicle>((event, emit) {
      FirebaseFirestore.instance.collection('vehicles').doc(event.id).delete();
      add(const GetAllVehicles());
    });
    on<UpdateVehicle>((event, emit) {
      FirebaseFirestore.instance
          .collection('vehicles')
          .doc(event.id)
          .update(event.updatedVehicle.toJson());
      add(const GetAllVehicles());
    });
  }
}
