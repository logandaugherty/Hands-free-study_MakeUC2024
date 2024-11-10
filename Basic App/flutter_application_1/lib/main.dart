// Basic App/flutter_application_1/lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'study.dart';
import 'profile.dart';
//import 'package:sflutter/material.dart';
import 'read.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _cardsStudied = 0;
  final int _totalCards = 100;

  void _incrementCardsStudied() {
    setState(() {
      if (_cardsStudied < _totalCards) {
        _cardsStudied++;
      }
    });
  }

  void _incrementCards() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReadPage()),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudySection()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ProfilePage(
                  profileName: 'John Doe',
                  cardsStudied: 100,
                  longestStreak: 10,
                  deck1: 'Science',
                  deck2: 'History',
                  deck3: 'Spanish',
                )),
      );
    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text(''),
    Text(''),
  ];

  @override
  Widget build(BuildContext context) {
    double progress = _cardsStudied / _totalCards;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      // greeting to the user

      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome to SpeakAble!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            //greeting to the user

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Your progress:',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$_cardsStudied',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.whatshot,
                        color: Color.fromARGB(255, 117, 37, 174),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                    minHeight: 10,
                  ),
                  const SizedBox(height: 20),
                  _widgetOptions.elementAt(_selectedIndex),

                  //logo
                  new Container(
                      width: 100,
                      height: 100,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: ExactAssetImage('assets/images/logo.png'),
                              fit: BoxFit.fitHeight))),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: _incrementCards,
              tooltip: 'Increment Cards Studied',
              child: const Icon(Icons.mic),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),

      //
      //bottom of the body to add a microphone button

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCardsStudied,
      //   tooltip: 'Increment Cards Studied',
      //   child: const Icon(Icons.mic),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Import',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
