// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/Chat/chat_cubit.dart' as _i10;
import '../../application/pre_booking/pre_booking_cubit.dart' as _i11;
import '../../application/vehicles/vehicles_bloc.dart' as _i9;
import '../../infrastructure/chat/chat_services_impl.dart' as _i4;
import '../../infrastructure/pre_bookings/pre_booking_services_impl.dart'
    as _i6;
import '../../infrastructure/vehicles/vehicles_services_impl.dart' as _i8;
import '../chat/chat_services.dart' as _i3;
import '../pre_booking/pre_booking_services.dart' as _i5;
import '../vehicles/vehicle_services.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ChatServices>(() => _i4.ChatServicesImpl());
  gh.lazySingleton<_i5.PreBookingServices>(() => _i6.PreBookingServiceImpl());
  gh.lazySingleton<_i7.VehicleServices>(
      () => _i8.VehicleServicesImplementation());
  gh.factory<_i9.VehiclesBloc>(
      () => _i9.VehiclesBloc(get<_i7.VehicleServices>()));
  gh.factory<_i10.ChatCubit>(() => _i10.ChatCubit(get<_i3.ChatServices>()));
  gh.factory<_i11.PreBookingCubit>(
      () => _i11.PreBookingCubit(get<_i5.PreBookingServices>()));
  return get;
}
