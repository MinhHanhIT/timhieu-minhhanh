import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StarupNamer());
}

class StarupNamer extends StatelessWidget {
  const StarupNamer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: RandomWord(),
        ),
      ),
    );
  }
}

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key}) : super(key: key);

  @override
  State<RandomWord> createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    _suggestions.addAll(generateWordPairs().take(50));
    return ListView.builder(
      itemCount: _suggestions.length,
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return const Divider();
        }

        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}
