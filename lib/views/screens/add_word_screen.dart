import 'package:flutter/material.dart';
import 'package:vocab_drawer/data/models/word_type.dart';
import 'package:vocab_drawer/services/hive_service.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  _AddWordScreenState createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  final HiveService _hiveService = HiveService();
  final _formKey = GlobalKey<FormState>();

  final _wordController = TextEditingController();
  final _translationController = TextEditingController();
  WordType _selectedType = WordType.noun;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Word')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _wordController,
                decoration: InputDecoration(labelText: 'Word'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              TextFormField(
                controller: _translationController,
                decoration: InputDecoration(labelText: 'Translation'),
              ),
              DropdownButtonFormField<WordType>(
                initialValue: _selectedType,
                items: WordType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.displayName),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  void notifyNPop() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Word added successfully!')),
                    );
                    Navigator.pop(context);
                  }

                  if (_formKey.currentState!.validate()) {
                    await _hiveService.addWord(
                      word: _wordController.text,
                      wordTranslate: _translationController.text,
                      wordType: _selectedType,
                    );
                    notifyNPop();
                  }
                },
                child: Text('Save Word'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
