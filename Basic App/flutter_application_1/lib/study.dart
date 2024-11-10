import 'package:flutter/material.dart';

class StudySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Section'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Add your add card logic here
              },
              child: const Text('Add Card'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your start reading cards logic here
              },
              child: const Text('Start Reading Cards'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StudySection(),
  ));
}
