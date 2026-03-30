import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vocab_drawer/data/user_prefs.dart';
import 'package:vocab_drawer/views/screen_manager.dart';
import 'package:vocab_drawer/data/models/word.dart';
import 'package:vocab_drawer/data/models/word_type.dart';
import 'package:vocab_drawer/data/models/language.dart';
import 'package:vocab_drawer/views/screens/word_list_screen.dart';

ValueNotifier<ThemeMode> currentModeNotifier = ValueNotifier(ThemeMode.system);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPrefs.init();
  await Hive.initFlutter();

  Hive.registerAdapter(WordAdapter());
  Hive.registerAdapter(WordTypeAdapter());
  Hive.registerAdapter(LanguageAdapter());

  await Hive.openBox<Word>('words');
  await Hive.openBox<Map>('wordSets');

  currentModeNotifier.value = UserPrefs.isDarkMode()
      ? ThemeMode.dark
      : ThemeMode.light;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentModeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: 'Vocab Drawer',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: currentMode,
          // home: PageManager(),
          home: WordListScreen(),
        );
      },
    );
  }
}
