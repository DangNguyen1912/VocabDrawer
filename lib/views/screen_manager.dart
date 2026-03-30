import 'package:flutter/material.dart';
import 'package:vocab_drawer/data/models/page_model.dart';
import 'package:vocab_drawer/data/user_prefs.dart';
import 'package:vocab_drawer/widgets/app_bar_widget.dart';
import 'package:vocab_drawer/views/screens/test.dart';
import 'package:vocab_drawer/views/screens/volcabulary_screen.dart';
import 'package:vocab_drawer/widgets/navigation_bar_widget.dart';

class PageManager extends StatelessWidget {
  PageManager({super.key});

  final List<PageModel> _pages = [
    PageModel(
      name: "Volcabulary",
      page: VolcabularyPage(),
      icon: Icons.menu_book,
    ),
    PageModel(name: "test", page: Test(), icon: Icons.adb),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPageIndexNovifier,
      builder: (context, currentPageIndex, child) {
        return Scaffold(
          appBar: AppBarWidget(title: _pages[currentPageIndex].name),
          body: _pages[currentPageIndex].page,
          bottomNavigationBar: NavigationBarWidget(pages: _pages),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsetsGeometry.zero,
              children: [
                DrawerHeader(child: Text("drawer header")),
                ListTile(
                  title: Text("change theme mode"),
                  onTap: () => UserPrefs.setDarkMode(!UserPrefs.isDarkMode()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
