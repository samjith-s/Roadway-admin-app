import 'package:admin/domain/vehicles/models/body_types_model.dart';
import 'package:admin/domain/vehicles/models/brand_medel.dart';
import 'package:admin/domain/vehicles/models/segment_model.dart';
import 'package:admin/domain/vehicles/models/vehicle_model.dart';
import 'package:dartz/dartz.dart';

abstract class VehicleServices {
  Future<Either<String, List<Segment>>> getSegments();
  Future<Either<String, List<BodyType>>> getBodyTypes();
  Future<Either<String, List<Brand>>> getAllBrands();
  Future<Either<String, List<Vehicle>>> getAllVehicle();
}
