part of 'vehicles_bloc.dart';

@freezed
class VehiclesState with _$VehiclesState {
  const factory VehiclesState({
    required List<Segment> segmentsList,
    required List<BodyType> bodyTypesList,
    required List<Brand> brandsList,
    required String? vehicleTypeDropdownValue,
    required String? vehicleMakeDropdownValue,
    required String? vehicleBodyTypesDropdownValue,
    required String? vehicleSegmentsDropdownValue,
    required String? vehicleFuelDropdownValue,
    required DateTime manufactureYear,
    required DateTime registrationYear,
    required List<XFile>? pickedImages,
    required double uploadImageProgress,
    required List<Vehicle> availableBikes,
    required List<Vehicle> availableCars,
    required bool isLoading,
    required bool isError,
    required String errorMsg,
  }) = _VehiclesState;

  factory VehiclesState.initial() => VehiclesState(
        segmentsList: [],
        bodyTypesList: [],
        brandsList: [],
        vehicleTypeDropdownValue: null,
        vehicleMakeDropdownValue: null,
        vehicleBodyTypesDropdownValue: null,
        vehicleSegmentsDropdownValue: null,
        vehicleFuelDropdownValue: null,
        manufactureYear: DateTime.now(),
        registrationYear: DateTime.now(),
        pickedImages: [],
        uploadImageProgress: 0,
        availableBikes: [],
        availableCars: [],
        isLoading: false,
        isError: false,
        errorMsg: '',
      );
}
