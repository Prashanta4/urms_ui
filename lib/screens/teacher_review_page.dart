import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherReviewPage extends StatelessWidget {
  const TeacherReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue[100]!, Colors.white],
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
                    'Teacher Review',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      // TODO: Implement search functionality
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Filter Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: const Text('Filter by Course or Department'),
                items: <String>['Biology', 'Mathematics', 'Physics'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  // TODO: Implement filter functionality
                },
              ),
            ),

            // Teacher List
            Expanded(
              child: ListView.separated(
                itemCount: 10, // Example count
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      // Placeholder for teacher avatar
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(
                      'Teacher Name ${index + 1}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Introduction to Biology'),
                    trailing: Chip(label: Text('${(index + 1) * 2} Reviews')),
                    onTap: () {
                      // Navigate to review submission page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherReviewSubmissionPage(teacherName: 'Teacher Name ${index + 1}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherReviewSubmissionPage extends StatelessWidget {
  final String teacherName;

  const TeacherReviewSubmissionPage({super.key, required this.teacherName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue[100]!, Colors.white],
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
                    teacherName,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    // Placeholder for teacher avatar
                    backgroundColor: Colors.blue,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Course Name
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.book),
                    const SizedBox(width: 8),
                    Text(
                      'Course: Introduction to Biology',
                      style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // Star Rating System
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: const Icon(Icons.star),
                  color: Colors.yellow,
                  onPressed: () {
                    // TODO: Implement rating functionality
                  },
                );
              }),
            ),

            // Review Text Box
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type your review here...',
                ),
              ),
            ),

            // Character Counter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('0/500 characters'),
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement cancel functionality
                    },
                    child: const Text('Cancel'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement post functionality
                    },
                    child: const Text('Post'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
