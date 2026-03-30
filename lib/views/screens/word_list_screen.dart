import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vocab_drawer/data/models/word.dart';
import 'package:vocab_drawer/views/screens/add_word_screen.dart';

class WordListScreen extends StatelessWidget {
  const WordListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Vocabulary')),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Word>('words').listenable(),
        builder: (context, Box<Word> box, _) {
          final words = box.values.toList();

          if (words.isEmpty) {
            return Center(child: Text('No words yet. Add your first word!'));
          }

          return ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) {
              final word = words[index];
              return ListTile(
                title: Text(word.word),
                subtitle: Text(word.wordTranslate ?? 'No translation'),
                trailing: Chip(label: Text(word.wordType.displayName)),
                onTap: () {
                  // Navigate to edit screen
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddWordScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
