part of 'vehicles_bloc.dart';

@freezed
class VehiclesEvent with _$VehiclesEvent {
  const factory VehiclesEvent.addSegment(
      {required String segment, required bool isCar}) = AddSegment;
  const factory VehiclesEvent.getSegments() = GetSegments;
  const factory VehiclesEvent.addBodyType(
      {required String bodyType, required bool isCar}) = AddBodyType;

  const factory VehiclesEvent.getBodyTypes() = GetBodyTypes;
  const factory VehiclesEvent.addBrands({required Brand brand}) = AddBrands;
  const factory VehiclesEvent.getAllBrands() = GetAllBrands;
  const factory VehiclesEvent.deleteBrand({required String id}) = DeleteBrand;
  const factory VehiclesEvent.changeVehicleTypeDropdownValue(
      {required String newValue}) = ChangeVehicleTypeDropdownValue;
  const factory VehiclesEvent.changeVehicleMakeDropdownValue(
      {required String newValue}) = ChangeVehicleMakeDropdownValue;
  const factory VehiclesEvent.changeVehicleSegmentsDropdownValue(
      {required String newValue}) = ChangeVehicleSegmentsDropdownValue;
  const factory VehiclesEvent.changeVehicleBodytypeDropdownValue(
      {required String newValue}) = ChangeVehicleBodytypeDropdownValue;

  const factory VehiclesEvent.changeVehicleFuelDropdownValue(
      {required String newValue}) = ChangeVehicleFuelDropdownValue;
  const factory VehiclesEvent.changeManufactureYear(
      {required DateTime newDate}) = ChangeManufactureYear;

  const factory VehiclesEvent.changeRegistrationYear(
      {required DateTime newDate}) = ChangeRegistrationYear;
  const factory VehiclesEvent.addPickedImages(
      {required List<XFile> pickedImages}) = AddPickedImages;
  const factory VehiclesEvent.changeDropDownValues({
    required String type,
  }) = ChangeDropDownValues;
  const factory VehiclesEvent.changeUploadImageProgress(
      {required double newValue}) = ChangeUploadImageProgress;
  const factory VehiclesEvent.addNewVehicleToDatabase(
      {required Vehicle newVehicle}) = AddNewVehicleToDatabase;
  const factory VehiclesEvent.getAllVehicles() = GetAllVehicles;

  const factory VehiclesEvent.deleteVehicle({required String id}) =
      DeleteVehicle;
  const factory VehiclesEvent.updateVehicle(
      {required Vehicle updatedVehicle, required String id}) = UpdateVehicle;
}
