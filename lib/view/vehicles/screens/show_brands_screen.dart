import 'dart:async';
import 'dart:io';

import 'package:admin/application/internet/internet_cubit.dart';
import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/toast.dart';
import 'package:admin/domain/vehicles/models/brand_medel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

ValueNotifier<String?> imageNotifier = ValueNotifier(null);

class ShowCarBrandsScreen extends StatefulWidget {
  const ShowCarBrandsScreen({Key? key}) : super(key: key);

  @override
  State<ShowCarBrandsScreen> createState() => _ShowCarBrandsScreenState();
}

class _ShowCarBrandsScreenState extends State<ShowCarBrandsScreen> {
  late TextEditingController brandsController;
  @override
  void initState() {
    brandsController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    brandsController.dispose();
    super.dispose();
  }

  String? _imagePath;
  String? _url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Brands',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: alertColor,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final XFile? iconPath = await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (iconPath != null) {
                              // setState(() {
                              //   _imagePath = iconPath.path;
                              // });
                              imageNotifier.value = iconPath.path;
                              String url = await uploadIconImage(iconPath);

                              setState(() {
                                _url = url;
                              });
                            }
                          },
                          child: ValueListenableBuilder(
                            valueListenable: imageNotifier,
                            builder: (BuildContext context, String? value, Widget? child) {
                              return CircleAvatar(
                                backgroundColor: alertColor,
                                backgroundImage: value != null
                                    ? FileImage(File(value))
                                    : const NetworkImage(
                                            'https://i.fbcd.co/products/resized/resized-750-500/563d0201e4359c2e890569e254ea14790eb370b71d08b6de5052511cc0352313.jpg')
                                        as ImageProvider,
                                radius: 30,
                              );
                            },
                          ),
                        ),
                        TextField(
                          controller: brandsController,
                          decoration: const InputDecoration(
                            labelText: 'Brand name',
                            // border:
                            //     OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: kYellow),
                          onPressed: () {
                            if (_url != null) {
                              BlocProvider.of<VehiclesBloc>(context).add(
                                AddBrands(
                                  brand: Brand(
                                    imagePath: _url!,
                                    name: brandsController.text.trim().toUpperCase(),
                                  ),
                                ),
                              );
                            }
                            Timer(
                              const Duration(seconds: 1),
                              () => showToast(
                                msg: "Item added successfuly", // message
                                bgcolor: ksuccess,
                              ),
                            );

                            Navigator.of(context).pop();
                          },
                          child: const Text('Add'),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.add,
              color: kBlack,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (!state.networkOn) {
                    showToast(
                      msg: "No network connection.Please check your connection", // message
                      bgcolor: kBlack,
                    );
                  }

                  return Container();
                },
              ),
              BlocBuilder<VehiclesBloc, VehiclesState>(
                builder: (context, state) {
                  if (state.isError) {
                    return Center(
                      child: Text(state.errorMsg),
                    );
                  }
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: .9,
                      ),
                      itemBuilder: (context, index) {
                        var brand = state.brandsList[index];

                        return GestureDetector(
                          onTap: () {
                            showBrandDeleteConfirmation(context, brand);
                          },
                          child: Container(
                            color: kYellow.withOpacity(.2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    brand.imagePath,
                                    width: 50,
                                    height: 50,
                                    errorBuilder: (context, obj, _) {
                                      return const SizedBox(
                                        width: 50,
                                        height: 50,
                                      );
                                    },
                                  ),
                                ),
                                Text(
                                  brand.name,
                                  style: GoogleFonts.abel(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: state.brandsList.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showBrandDeleteConfirmation(BuildContext context, Brand brand) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(8),
        backgroundColor: alertColor,
        content: SizedBox(
          width: MediaQuery.of(context).size.width - 80,
          height: 120,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 20),
            Text(
              'This item will be permenently deleted!',
              style: GoogleFonts.montserrat(
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Do you want to delete this item?',
              style: GoogleFonts.montserrat(
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'No',
                    style: GoogleFonts.hind(
                      color: Colors.blue,
                    ),
                  ),
                ),
                BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () {
                        if (state.networkOn) {
                          BlocProvider.of<VehiclesBloc>(context).add(
                            DeleteBrand(id: brand.brandId!),
                          );
                          showToast(
                            msg: "Item deleted successfuly", // message
                            bgcolor: Colors.red,
                          );
                        } else {
                          showToast(
                            msg: "No network connection.Please enable network to continue", // message
                            bgcolor: kBlack,
                          );
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Yes',
                        style: GoogleFonts.hind(
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

Future<String> uploadIconImage(XFile brandImage) async {
  Reference ref = FirebaseStorage.instance.ref().child('brandIcons/${brandImage.path}');
  final UploadTask uploadTask = ref.putFile(File(brandImage.path));
  final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
  final url = await taskSnapshot.ref.getDownloadURL();
  return url;
}
