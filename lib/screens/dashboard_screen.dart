import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Semester: 251 (Spring 2025)',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Student: 221014136 Prashanta Sarker',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Adviser: Dr. T.M. Abul Kalam Azad',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Email: abul.kalam@ulab.edu.bd',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuCard(context, 'Billing History', Icons.history),
                  _buildMenuCard(context, 'Current Status', Icons.info),
                  _buildMenuCard(
                    context,
                    'Preregistration',
                    Icons.app_registration,
                  ),
                  _buildMenuCard(
                    context,
                    'Class Schedule',
                    Icons.calendar_today,
                  ),
                  _buildMenuCard(context, 'My Profile', Icons.person),
                  _buildMenuCard(context, 'Change Password', Icons.lock),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        onTap: (index) {
          if (index == 2) {
            Get.toNamed('/home');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Billing'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'Result'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: Navigate to respective pages
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Theme.of(context).primaryColor),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
