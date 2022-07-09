// import 'package:admin/core/constants/colors.dart';
// import 'package:admin/view/home/widgets/dashboard_item.dart';
// import 'package:admin/view/sell_req/screens/sell_requests_listing_screen.dart';
// import 'package:admin/view/users/screens/users_listing_screen.dart';
// import 'package:admin/view/vehicles/screens/vehicles_dashboard_screen.dart';
// import 'package:admin/view/videos/screens/video_collection_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final dataOntapCallbacks = [
//       () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: ((context) => const VideoCollectionScreen()),
//           ),
//         );
//       },
//       () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: ((context) => const VehicleSectionDashBoard()),
//           ),
//         );
//       },
//       // () {
//       //   Navigator.of(context).push(
//       //     MaterialPageRoute(
//       //       builder: ((context) => const BikeSectionDashBoard()),
//       //     ),
//       //   );
//       // },
//       () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: ((context) => const UsersListingScreen()),
//           ),
//         );
//       },
//       () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//               builder: (context) => const SellRequestsListingScreen()),
//         );
//       },
//       () {},
//     ];
//     return Scaffold(
//       //backgroundColor: kScaffoldgColor,
//       appBar: AppBar(
//         title: Text(
//           'Dashboard',
//           style: GoogleFonts.abel(fontSize: 24),
//         ),
//         centerTitle: true,
//         backgroundColor: kGreen,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//             child: Column(
//           children: [
//             const SizedBox(height: 30),
//             Text(
//               'DATA',
//               style: GoogleFonts.poppins(
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               children: List.generate(
//                 3,
//                 ((index) {
//                   return DashBoardScreenItemWidget(
//                     itemIcon: dataIcons[index],
//                     itemLabel: dataLabels[index],
//                     onTap: dataOntapCallbacks[index],
//                   );
//                 }),
//               ),
//             ),
//             const SizedBox(height: 30),
//             Text(
//               'SERVICES',
//               style: GoogleFonts.poppins(
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               children: List.generate(
//                 2,
//                 ((index) {
//                   return DashBoardScreenItemWidget(
//                     itemIcon: dataIcons[index + 3],
//                     itemLabel: dataLabels[index + 3],
//                     onTap: dataOntapCallbacks[index + 3],
//                   );
//                 }),
//               ),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }

// final dataIcons = [
//   Icons.video_collection_outlined,
//   Icons.time_to_leave,
//   //Icons.motorcycle,
//   Icons.person,
//   Icons.sell,
//   Icons.book,
// ];
// final dataLabels = [
//   "Videos",
//   "Vehicles",
//   // "Bikes",
//   "Users",
//   "Sell Requests",
//   "Pre-Bookings"
// ];
