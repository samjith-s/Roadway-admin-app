import 'dart:developer';

import 'package:admin/domain/sell_request/sell_request_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sell_request_state.dart';
part 'sell_request_cubit.freezed.dart';

class SellRequestCubit extends Cubit<SellRequestState> {
  SellRequestCubit() : super(SellRequestState.initial());

  Future getAllSellRequests() async {
    emit(state.copyWith(isLoading: true, isError: false));
    List<SellRequest> result = [];
    try {
      CollectionReference sellRequestRef = FirebaseFirestore.instance.collection('sell_requests');

      QuerySnapshot<Object?> sellRequests = await sellRequestRef.get();

      if (sellRequests.docs.isNotEmpty) {
        result = sellRequests.docs.map((doc) => SellRequest.fromJson(doc.data() as Map<String, dynamic>)).toList();
        // List<Values> _myList = [];
        // _myList.sort((a, b) => a["timestamp"].compareTo(b["timestamp"]));

        result.sort(((a, b) => b.datetime.compareTo(a.datetime)));
        emit(state.copyWith(
          totalRequests: result,
          isLoading: false,
          isError: false,
          showSearchResult: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(isError: true));
      log(e.toString());
    }
  }

  Future deleteRequest({required String id}) async {
    try {
      CollectionReference sellRequestRef = FirebaseFirestore.instance.collection('sell_requests');

      await sellRequestRef.doc(id).delete();
      await getAllSellRequests();
    } catch (e) {
      emit(state.copyWith(isError: true));
      log(e.toString());
    }
  }

  Future<void> searchSellRequestDetails({
    required String searchKey,
    required List<SellRequest> allList,
  }) async {
    emit(state.copyWith(
      isError: false,
      isLoading: true,
      errorText: '',
    ));

    var result = allList
        .where(
          (element) => (element.make.toLowerCase().contains(searchKey.toLowerCase()) ||
              element.model.contains(searchKey.toUpperCase()) ||
              element.name.toLowerCase().contains(searchKey.toLowerCase())),
        )
        .toList();

    emit(state.copyWith(
      isError: false,
      isLoading: false,
      showSearchResult: true,
      searchResult: result,
      errorText: '',
    ));
  }
}
