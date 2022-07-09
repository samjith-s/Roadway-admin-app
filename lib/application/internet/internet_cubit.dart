import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_state.dart';
part 'internet_cubit.freezed.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetState.initial()) {
    StreamSubscription connectivityStreamSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        emit(state.copyWith(networkOn: false));
      } else {
        emit(state.copyWith(networkOn: true));
      }
    });
  }
}
