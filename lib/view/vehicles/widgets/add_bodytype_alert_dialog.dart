import 'dart:async';

import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/toast.dart';
import 'package:admin/view/vehicles/widgets/bodytype_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

GlobalKey<FormState> _bodyTypeFormKey = GlobalKey();

class AddBodyTypeAlertDialogWidget extends StatefulWidget {
  const AddBodyTypeAlertDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddBodyTypeAlertDialogWidget> createState() =>
      _AddBodyTypeAlertDialogWidgetState();
}

class _AddBodyTypeAlertDialogWidgetState
    extends State<AddBodyTypeAlertDialogWidget> {
  late TextEditingController bodyTypeConroller;

  @override
  void initState() {
    bodyTypeConroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    bodyTypeConroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: alertColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ValueListenableBuilder(
            valueListenable: groupValueNotifier,
            builder:
                (BuildContext context, VehicleType groupValue, Widget? child) {
              return Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 25,
                        child: Radio(
                          value: VehicleType.car,
                          groupValue: groupValue,
                          onChanged: (value) {
                            groupValueNotifier.value = VehicleType.car;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('car'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: VehicleType.bike,
                        groupValue: groupValue,
                        onChanged: (value) {
                          groupValueNotifier.value = VehicleType.bike;
                        },
                      ),
                      const Text('bike'),
                    ],
                  ),
                ],
              );
            },
          ),
          TextFormField(
            key: _bodyTypeFormKey,
            validator: (value) {
              if (value == null || value.trim() == '') {
                return 'cannot be empty';
              } else {
                return null;
              }
            },
            controller: bodyTypeConroller,
            decoration: const InputDecoration(
              labelText: 'body type',
              // border:
              //     OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!_bodyTypeFormKey.currentState!.validate()) {
                return;
              }
              BlocProvider.of<VehiclesBloc>(context).add(
                AddBodyType(
                  isCar: groupValueNotifier.value == VehicleType.bike
                      ? false
                      : true,
                  bodyType: bodyTypeConroller.text.trim().toUpperCase(),
                ),
              );
              Timer(
                const Duration(seconds: 1),
                () => showToast(
                  msg: "Item added successfuly", // message
                ),
              );
            },
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}
