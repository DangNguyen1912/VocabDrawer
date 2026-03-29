import 'package:flutter/material.dart';
import 'package:vocab_drawer/main.dart';

class VolcabularyPage extends StatelessWidget {
  const VolcabularyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentModeNotifier,
      builder: (context, value, child) {
        return Center(child: Text(value == .dark ? "dark" : "light"));
      },
    );
  }
}
