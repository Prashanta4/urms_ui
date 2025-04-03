import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreregistrationPage extends StatelessWidget {
  const PreregistrationPage({super.key});

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
                    'Preregistration',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 48), // Placeholder for search icon
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Pre-advising Status Card
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pre-advising Status:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ), // Example icon
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('Maximum credit limit: 14.0'),
                    Text('Total taken courses: 5'),
                    Text('Total used credit: 13.0'),
                    LinearProgressIndicator(value: 13.0 / 14.0),
                  ],
                ),
              ),
            ),

            // See Co-curricular Courses Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement functionality
              },
              child: const Text('See Co-curricular Courses'),
            ),

            // Courses Table
            Expanded(
              child: Card(
                margin: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Allow horizontal scrolling for the table
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Course ID')),
                      DataColumn(label: Text('Course Name')),
                      DataColumn(label: Text('Credits')),
                      DataColumn(label: Text('Mandatory?')),
                      DataColumn(label: Text('Taken?')),
                    ],
                    rows: List<DataRow>.generate(10, (index) {
                      return DataRow(
                        cells: [
                          DataCell(Text('CSE${index + 101}')),
                          DataCell(Text('Course Name ${index + 1}')),
                          DataCell(Text('3')),
                          DataCell(Text(index % 2 == 0 ? 'Yes' : 'No')),
                          DataCell(Text(index % 2 == 0 ? 'Yes' : 'No')),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
