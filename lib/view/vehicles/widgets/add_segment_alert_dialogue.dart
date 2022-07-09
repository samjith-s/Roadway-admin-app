import 'dart:async';

import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/toast.dart';
import 'package:admin/view/vehicles/widgets/bodytype_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../application/vehicles/vehicles_bloc.dart';

final GlobalKey<FormState> _segmentKey = GlobalKey();

class AddSegmetAlertDialogue extends StatefulWidget {
  const AddSegmetAlertDialogue({
    Key? key,
  }) : super(key: key);

  @override
  State<AddSegmetAlertDialogue> createState() => _AddSegmetAlertDialogueState();
}

class _AddSegmetAlertDialogueState extends State<AddSegmetAlertDialogue> {
  late TextEditingController segmentController;
  @override
  void initState() {
    segmentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    segmentController.dispose();
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
            key: _segmentKey,
            validator: (value) {
              if (value == null || value.trim() == '') {
                return 'cannot be empty';
              } else {
                return null;
              }
            },
            controller: segmentController,
            decoration: const InputDecoration(
              labelText: 'segment name',
              // border:
              //     OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!_segmentKey.currentState!.validate()) {
                return;
              }
              BlocProvider.of<VehiclesBloc>(context).add(
                AddSegment(
                  isCar: groupValueNotifier.value == VehicleType.bike
                      ? false
                      : true,
                  segment: segmentController.text.trim(),
                ),
              );
              Navigator.of(context).pop();
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
