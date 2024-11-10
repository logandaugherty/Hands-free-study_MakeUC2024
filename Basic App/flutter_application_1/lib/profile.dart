import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String profileName;
  final int cardsStudied;
  final int longestStreak;
  final String deck1;
  final String deck2;
  final String deck3;

  const ProfilePage({
    super.key,
    required this.profileName,
    required this.cardsStudied,
    required this.longestStreak,
    required this.deck1,
    required this.deck2,
    required this.deck3,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 70,
              decoration:
                  BoxDecoration(color: Colors.deepPurple.withOpacity(.50)),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  profileName,
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Longest Streak: $longestStreak days',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Study Decks:',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              decoration:
                  BoxDecoration(color: Colors.deepPurple.withOpacity(0.25)),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  deck1,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              decoration:
                  BoxDecoration(color: Colors.deepPurple.withOpacity(0.25)),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  deck2,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              decoration:
                  BoxDecoration(color: Colors.deepPurple.withOpacity(0.25)),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  deck3,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
