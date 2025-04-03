import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/my_review_screen.dart'; // Importing MyReviewScreen

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 35),
                ),
                SizedBox(height: 10),
                Text(
                  'Student Name',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Teachers'),
            onTap: () {
              // TODO: Navigate to Teachers page
            },
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text('My Review'),
            onTap: () {
              Get.back(); // Close the drawer first
              Get.to(() => const MyReviewScreen());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // TODO: Implement logout logic
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}