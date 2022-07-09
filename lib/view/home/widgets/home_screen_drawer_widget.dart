import 'package:admin/core/constants/colors.dart';
import 'package:admin/view/pre_bookings/pre_booking_screen.dart';
import 'package:admin/view/sell_req/screens/sell_requests_listing_screen.dart';
import 'package:admin/view/users/screens/users_listing_screen.dart';
import 'package:admin/view/vehicles/screens/vehicles_dashboard_screen.dart';
import 'package:admin/view/videos/screens/video_collection_screen.dart';
import 'package:flutter/material.dart';

class AdminDrowerWidget extends StatelessWidget {
  const AdminDrowerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: kGreen,
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png'),
                ),
                SizedBox(height: 5),
                Text('admin'),
                SizedBox(height: 5),
                Text('admin@gmail.com'),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.collections),
            title: const Text('Videos'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const VideoCollectionScreen()),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.time_to_leave),
            title: const Text('Vehicles'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const VehicleSectionDashBoard()),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Pre-bookings'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const PreBookingsListingScreen()),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sell),
            title: const Text('Sell requests'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const SellRequestsListingScreen()),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_pin_rounded),
            title: const Text('Users'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const UsersListingScreen()),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
