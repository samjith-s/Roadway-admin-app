import 'dart:developer';

import 'package:admin/application/Chat/chat_cubit.dart';
import 'package:admin/application/internet/internet_cubit.dart';
import 'package:admin/application/login/login_cubit.dart';
import 'package:admin/application/pre_booking/pre_booking_cubit.dart';
import 'package:admin/application/sell_request/sell_request_cubit.dart';
import 'package:admin/application/users/users_cubit.dart';
import 'package:admin/application/vehicles/vehicles_bloc.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/domain/depentancy_injection/injectable.dart';
import 'package:admin/local_notifications_services.dart';
import 'package:admin/view/home/screens/admin_home_screen.dart';
import 'package:admin/view/login/screens/admin_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection();
  await Firebase.initializeApp();

  LocalNotificationService().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => getIt<VehiclesBloc>()),
        BlocProvider(create: (context) => UsersCubit()),
        BlocProvider(create: (context) => SellRequestCubit()),
        BlocProvider(create: (context) => InternetCubit()),
        BlocProvider(create: (context) => getIt<PreBookingCubit>()),
        BlocProvider(create: (context) => getIt<ChatCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xffe5e4e4), // const Color.fromARGB(255, 215, 224, 228),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color(0xffe5e4e4), // const Color.fromARGB(255, 215, 224, 228),
            titleTextStyle: GoogleFonts.nunito(
              color: kBlack,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: const IconThemeData(color: kBlack),
          ),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final bool loggedIn = snapshot.hasData;
              return loggedIn ? const AdminHomeScreen() : const AdminLoginScreen();
            }

            return Container();
          },
        ),
      ),
    );
  }
}
