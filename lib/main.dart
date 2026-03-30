import 'package:flutter/material.dart';
import 'package:vocab_drawer/data/user_prefs.dart';
import 'package:vocab_drawer/views/page_manager.dart';

ValueNotifier<ThemeMode> currentModeNotifier = ValueNotifier(ThemeMode.system);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPrefs.init();
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
          home: PageManager(),
        );
      },
    );
  }
}
