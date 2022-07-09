import 'dart:developer';

import 'package:admin/domain/user/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.dart';
part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersState.initial());

  getAllUsers() async {
    emit(
      state.copyWith(
        isLoading: true,
        isError: false,
      ),
    );
    List<UserModel> result = [];
    try {
      CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

      QuerySnapshot<Object?> users = await usersRef.get();

      if (users.docs.isNotEmpty) {
        result = users.docs.map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
        emit(state.copyWith(totalUsers: result, isLoading: false, isError: false));
      }
    } catch (e) {
      emit(state.copyWith(
        isError: true,
        isLoading: false,
      ));
      log(e.toString());
    }
  }

  Future<void> searchUser({
    required String searchKey,
    required List<UserModel> allList,
  }) async {
    emit(state.copyWith(
      isError: false,
      isLoading: true,

      // errorText: '',
    ));

    var result = allList
        .where(
          (element) => (element.name.toLowerCase().contains(searchKey.toLowerCase()) ||
              element.email.toLowerCase().contains(searchKey.toLowerCase())),
        )
        .toList();

    emit(state.copyWith(
      isError: false,
      isLoading: false,
      showSearchResult: true,
      userSearchResult: result,
      // errorText: '',
    ));
  }
}
