import 'package:flutter/material.dart';

class StudySection extends StatelessWidget {
  final TextEditingController TermController = TextEditingController();
  final TextEditingController DefinitionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Section'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: TermController,
              decoration: const InputDecoration(labelText: 'Term'),
            ),
            TextFormField(
              controller: DefinitionController,
              decoration: const InputDecoration(labelText: 'Definition'),
            ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Card()),
                );
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
