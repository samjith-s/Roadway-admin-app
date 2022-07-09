import 'dart:developer';

import 'package:admin/domain/vehicles/models/brand_medel.dart';
import 'package:admin/domain/vehicles/models/segment_model.dart';
import 'package:admin/domain/vehicles/models/body_types_model.dart';
import 'package:admin/domain/vehicles/models/vehicle_model.dart';
import 'package:admin/domain/vehicles/vehicle_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VehicleServices)
class VehicleServicesImplementation extends VehicleServices {
  List<BodyType> _result = [];
  @override
  Future<Either<String, List<BodyType>>> getBodyTypes() async {
    try {
      CollectionReference bodytypes = FirebaseFirestore.instance
          .collection('vehicles')
          .doc('vehiclesbodytypes')
          .collection('bodytypes');
      QuerySnapshot<Object?> bodyTypesList = await bodytypes.get();
      if (bodyTypesList.docs.isNotEmpty) {
        _result = bodyTypesList.docs
            .map((e) => BodyType.fromJson(e.data() as Map<String, dynamic>))
            .toList();
        return right(_result);
      }
      return left("Can't connect with server!.Please try again");
    } on FirebaseException catch (e) {
      log(e.code);
      return left("Can't connect with server!.Please try again");
    } catch (e) {
      log(e.toString());
      return left("Unknown error occured.Please try again");
    }
  }

  @override
  Future<Either<String, List<Segment>>> getSegments() async {
    List<Segment> result = [];
    try {
      CollectionReference segments = FirebaseFirestore.instance
          .collection('vehicles')
          .doc('vehiclesegments')
          .collection('segments');
      QuerySnapshot<Object?> segmentList = await segments.get();
      if (segmentList.docs.isNotEmpty) {
        result = segmentList.docs
            .map((e) => Segment.fromJson(e.data() as Map<String, dynamic>))
            .toList();
        return right(result);
      }
      return left("Can't connect with server!.Please try again");
    } on FirebaseException catch (e) {
      log(e.code);
      return left("Can't connect with server!.Please try again");
    } catch (e) {
      log(e.toString());
      return left("Unknown error occured.Please try again");
    }
  }

  @override
  Future<Either<String, List<Brand>>> getAllBrands() async {
    List<Brand> result = [];
    try {
      CollectionReference brands = FirebaseFirestore.instance
          .collection('vehicles')
          .doc('vehiclesbrands')
          .collection('brands');
      QuerySnapshot<Object?> brandscollection = await brands.get();
      if (brandscollection.docs.isNotEmpty) {
        result = brandscollection.docs
            .map((e) => Brand.fromJson(e.data() as Map<String, dynamic>))
            .toList();
        return right(result);
      }
      return left("Can't connect with server!.Please try again");
    } on FirebaseException catch (e) {
      log(e.code);
      return left("Can't connect with server!.Please try again");
    } catch (e) {
      log(e.toString());
      return left("Unknown error occured.Please try again");
    }
  }

  @override
  Future<Either<String, List<Vehicle>>> getAllVehicle() async {
    log('why is this happening ');
    List<Vehicle> result = [];
    try {
      CollectionReference vehiclesRef =
          FirebaseFirestore.instance.collection('vehicles');
      QuerySnapshot<Object?> vehicles = await vehiclesRef.get();
      if (vehicles.docs.isNotEmpty) {
        result = vehicles.docs
            .map((e) => Vehicle.fromJson(e.data() as Map<String, dynamic>))
            .toList();
        return right(result);
      }
      return left("Can't connect with server!.Please try again");
    } on FirebaseException catch (e) {
      log(e.code);
      return left("Can't connect with server!.Please try again");
    } catch (e) {
      log(e.toString());
      return left("Unknown error occured.Please try again");
    }
  }
}
