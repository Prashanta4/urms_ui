import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Allow scrolling for the entire page
        child: Container(
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
                      'Result',
                      style: GoogleFonts.roboto(
                        fontSize: 20, // Smaller font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_list, color: Colors.white),
                      onPressed: () {
                        // TODO: Implement filter functionality
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Summary Card
              Card(
                color: Colors.lightBlue,
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Overall CGPA: 3.8',
                        style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold), // Smaller font size
                      ),
                      Text(
                        'Total Credits Completed: 120',
                        style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold), // Smaller font size
                      ),
                    ],
                  ),
                ),
              ),

              // Semester-Wise GPA Table
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Allow horizontal scrolling for the table
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('SEMESTER', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Credit Hours Completed', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('GPA', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('CGPA', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                    ],
                    rows: List<DataRow>.generate(4, (index) {
                      return DataRow(cells: [
                        DataCell(Row(
                          children: [
                            const Icon(Icons.calendar_today),
                            const SizedBox(width: 8),
                            Text('Semester ${index + 1}'),
                          ],
                        )),
                        DataCell(Text('15')),
                        DataCell(Row(
                          children: [
                            const CircularProgressIndicator(value: 0.8, color: Colors.green),
                            const SizedBox(width: 8),
                            Text('3.5'),
                          ],
                        )),
                        DataCell(Text('3.8')),
                      ]);
                    }),
                  ),
                ),
              ),

              // Collapsible Card for Completed/Registered Courses
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ExpansionTile(
                  title: Text(
                    'Result of completed/registered courses:',
                    style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Allow horizontal scrolling for the table
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Semester', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Course', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Course Title', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Type', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Credit', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Result', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                        ],
                        rows: List<DataRow>.generate(4, (index) {
                          return DataRow(cells: [
                            DataCell(Text('Semester ${index + 1}')),
                            DataCell(Text('Course ${index + 1}')),
                            DataCell(Text('Course Title ${index + 1}')),
                            DataCell(Text('Type ${index + 1}')),
                            DataCell(Text('3')),
                            DataCell(
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: index % 2 == 0 ? Colors.green : Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  index % 2 == 0 ? 'Pass' : 'Fail',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ]);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
