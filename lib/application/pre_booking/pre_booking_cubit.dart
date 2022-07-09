import 'dart:async';

import 'package:admin/domain/pre_booking/pre_booking_model.dart';
import 'package:admin/domain/pre_booking/pre_booking_services.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core/toast.dart';

part 'pre_booking_state.dart';
part 'pre_booking_cubit.freezed.dart';

@injectable
class PreBookingCubit extends Cubit<PreBookingState> {
  final PreBookingServices _preBookingServices;
  PreBookingCubit(this._preBookingServices) : super(PreBookingState.inital());

  Future<void> getAllBookingDetails() async {
    emit(state.copyWith(
      isError: false,
      isLoading: true,
      errorText: '',
    ));
    final result = await _preBookingServices.getAllBookingDetails();

    result.fold(
      (error) => emit(
        state.copyWith(
          isError: true,
          isLoading: false,
          errorText: error,
        ),
      ),
      (bookings) => emit(
        state.copyWith(
          showSearchResult: false,
          totalBookings: bookings,
          isError: false,
          isLoading: false,
          errorText: '',
        ),
      ),
    );
  }

  Future<void> deleteBooking({required String id}) async {
    try {
      FirebaseFirestore.instance.collection('pre_bookings').doc(id).delete();
      Timer(
        const Duration(seconds: 1),
        (() => showToast(
              msg: 'Booking cancel successful',
            )),
      );
    } on FirebaseException catch (e) {
      state.copyWith(
        isError: true,
        isLoading: false,
        errorText: e.message.toString(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          isLoading: false,
          errorText: 'Unknown error occured while fetching data!. please try again',
        ),
      );
    }
    getAllBookingDetails();
  }

  Future<void> searchBookingDetails({
    required String searchKey,
    required List<PreBooking> allList,
  }) async {
    emit(state.copyWith(
      isError: false,
      isLoading: true,
      errorText: '',
    ));

    var result = allList
        .where(
          (element) => (element.make.toLowerCase().contains(searchKey.toLowerCase()) ||
              element.model.toLowerCase().contains(searchKey.toLowerCase()) ||
              element.name.toLowerCase().contains(searchKey.toLowerCase())),
        )
        .toList();

    emit(state.copyWith(
      isError: false,
      isLoading: false,
      showSearchResult: true,
      bookingSearchResult: result,
      errorText: '',
    ));
  }
}
