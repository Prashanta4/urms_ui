import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[200]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Header Bar
            Container(
              color: Colors.blue[800],
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop(); // Navigate back
                    },
                  ),
                  Text(
                    'My Profile',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      // TODO: Implement edit profile functionality
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // User Info Card
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Prashanta Sarker',
                      style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'ID: 221014136',
                      style: GoogleFonts.roboto(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // Personal Info Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Personal Info', style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Active Status: Active', style: GoogleFonts.roboto(fontSize: 16)),
                ],
              ),
            ),

            // Contact Info Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact Info', style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Email: example@example.com', style: GoogleFonts.roboto(fontSize: 16)),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement copy email functionality
                    },
                    child: const Text('Copy'),
                  ),
                ],
              ),
            ),

            // Address Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Address', style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('123 Main St, City, Country', style: GoogleFonts.roboto(fontSize: 16)),
                ],
              ),
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement logout functionality
                },
                child: const Text('Logout'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}