import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'deck.dart' as custom_deck; // Alias the import

// ignore: must_be_immutable
class ReadPage extends StatefulWidget {
  ReadPage({super.key});

  // Initialize a Deck with some Card objects
  custom_deck.Deck hi = custom_deck.Deck.withCards([
    custom_deck.Card("atrial fibrillation", "A type of cardiac arrhythmia."),
    custom_deck.Card("Sinus Arrhythmia", "A variation in sinus cycle length."),
    custom_deck.Card(
        "Atrial Tachycardia", "A tachycardia arising above the AV junction."),
  ]);

  @override
  // ignore: library_private_types_in_public_api
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  late stt.SpeechToText _speech;
  late FlutterTts _flutterTts;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  String _statusMessage = '';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _flutterTts = FlutterTts();
    // Start by reading the definition of the first card
    _speak(widget.hi.deck[_currentIndex].def);
  }

  // Function to speak out the text
  void _speak(String text) async {
    await _flutterTts.speak(text);
  }

  // Function to start listening to the user's input
  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) {
          setState(() {
            _text = val.recognizedWords;
            // Check if the recognized words match the term of the current card
            if (_text.toLowerCase() ==
                widget.hi.deck[_currentIndex].term.toLowerCase()) {
              _statusMessage = 'Success!';
            } else {
              _statusMessage = 'Try again!';
            }
          });
        },
      );
    } else {
      print('The user has denied the use of speech recognition.');
    }
  }

  // Function to stop listening and move to the next card
  void _stopListening() {
    if (_isListening) {
      _speech.stop();
      setState(() {
        _isListening = false;
        // Move to the next card
        _currentIndex = (_currentIndex + 1) % widget.hi.deck.length;
        // Speak the definition of the next card
        _speak(widget.hi.deck[_currentIndex].def);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isListening ? _stopListening : _startListening,
              child: Text(_isListening ? 'Stop Listening' : 'Start Listening'),
            ),
            const SizedBox(height: 20),
            Text(
              _statusMessage,
              style: TextStyle(
                fontSize: 24,
                color: _statusMessage == 'Success!' ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
