import 'package:flutter/material.dart';
import 'package:vocab_drawer/data/models/page_model.dart';

ValueNotifier<int> currentPageIndexNovifier = ValueNotifier(0);

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key, required this.pages});
  final List<PageModel> pages;

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = currentPageIndexNovifier.value;
    return NavigationBar(
      onDestinationSelected: (int index) {
        currentPageIndexNovifier = ValueNotifier(index);
        currentPageIndex = index;
      },
      indicatorColor: Theme.of(context).colorScheme.primary,
      selectedIndex: currentPageIndex,
      destinations: pages
          .map(
            (page) => NavigationDestination(
              icon: Icon(
                page.icon,
                color: Theme.of(context).colorScheme.primary,
              ),
              selectedIcon: Icon(
                page.icon,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              label: page.name,
            ),
          )
          .toList(),
    );
  }
}
