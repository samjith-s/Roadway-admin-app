import 'package:admin/domain/pre_booking/pre_booking_model.dart';
import 'package:admin/domain/pre_booking/pre_booking_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PreBookingServices)
class PreBookingServiceImpl extends PreBookingServices {
  @override
  Future<Either<String, List<PreBooking>>> getAllBookingDetails() async {
    try {
      QuerySnapshot<Map<String, dynamic>> documents = await FirebaseFirestore.instance.collection('pre_bookings').get();

      List<PreBooking> result = documents.docs.map((e) => PreBooking.fromJson(e.data())).toList();
      return right(result);
    } on FirebaseException catch (e) {
      return left(e.message.toString());
    } catch (e) {
      return left('Unknown error occured!. please try again.');
    }
  }
}
