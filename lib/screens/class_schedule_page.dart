import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassSchedulePage extends StatelessWidget {
  const ClassSchedulePage({super.key});

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
                    'Class Schedule',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.white),
                    onPressed: () {
                      // TODO: Implement calendar view toggle
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Class Schedule Table
            Expanded(
              child: Card(
                margin: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Allow horizontal scrolling for the table
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Course ID')),
                      DataColumn(label: Text('Course Name')),
                      DataColumn(label: Text('Section')),
                      DataColumn(label: Text('Day')),
                      DataColumn(label: Text('Time')),
                      DataColumn(label: Text('Room No')),
                      DataColumn(label: Text('Class Link')),
                    ],
                    rows: List<DataRow>.generate(10, (index) {
                      return DataRow(cells: [
                        DataCell(Text('CSE${index + 101}')),
                        DataCell(Text('Course Name ${index + 1}')),
                        DataCell(Text('A')),
                        DataCell(Text('Monday')),
                        DataCell(Text('10:00 AM')),
                        DataCell(Text('Room ${index + 1}')),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement join class functionality
                            },
                            child: const Text('Join'),
                          ),
                        ),
                      ]);
                    }),
                  ),
                ),
              ),
            ),

            // Set Reminder Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement set reminder functionality
              },
              child: const Text('Set Reminder'),
            ),
          ],
        ),
      ),
    );
  }
}