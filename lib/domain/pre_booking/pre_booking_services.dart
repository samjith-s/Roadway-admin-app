import 'package:admin/domain/pre_booking/pre_booking_model.dart';
import 'package:dartz/dartz.dart';

abstract class PreBookingServices {
  Future<Either<String, List<PreBooking>>> getAllBookingDetails();
}
