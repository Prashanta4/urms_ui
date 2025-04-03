import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingHistoryPage extends StatelessWidget {
  const BillingHistoryPage({super.key});

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
                    'Billing History',
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

            // Total Amount Card
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Total Remaining Amount: \$100',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Total Paid: \$400',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    // Placeholder for pie chart
                    Container(
                      height: 100,
                      color: Colors.grey[300],
                      child: const Center(child: Text('Pie Chart Placeholder')),
                    ),
                  ],
                ),
              ),
            ),

            // Pay Now Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement payment functionality
              },
              child: const Text('Pay Now'),
            ),

            // Billing History Table
            Expanded(
              child: Card(
                margin: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Course')),
                      DataColumn(label: Text('Credits')),
                      DataColumn(label: Text('Cost')),
                    ],
                    rows: List<DataRow>.generate(10, (index) {
                      return DataRow(cells: [
                        DataCell(Text('Course ${index + 1}')),
                        DataCell(Text('3')),
                        DataCell(Text('\$${(index + 1) * 100}')),
                      ]);
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
