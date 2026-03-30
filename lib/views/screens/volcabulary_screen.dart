import 'package:flutter/material.dart';

class VolcabularyPage extends StatelessWidget {
  const VolcabularyPage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isLeftColHidenNotifier = ValueNotifier(false);
    ValueNotifier<bool> isRightColHidenNotifier = ValueNotifier(false);

    return ListView(
      padding: EdgeInsetsGeometry.all(20),
      children: [
        Row(
          children: [
            // Hide left col
            IconButton(
              onPressed: () {
                isLeftColHidenNotifier.value = !isLeftColHidenNotifier.value;
              },
              icon: ValueListenableBuilder(
                valueListenable: isLeftColHidenNotifier,
                builder: (context, isLeftColHiden, child) {
                  return isLeftColHiden
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility);
                },
              ),
            ),
            // Hide right col
          ],
        ),

        DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            border: Border(bottom: Divider.createBorderSide(context)),
          ),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder(
                valueListenable: isLeftColHidenNotifier,
                builder: (context, isLeftColHiden, child) {
                  return AnimatedOpacity(
                    opacity: isLeftColHiden ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Text('Fading Text'),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: isRightColHidenNotifier,
                builder: (context, isRightColHiden, child) {
                  return AnimatedOpacity(
                    opacity: isRightColHiden ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Text('Fading Text'),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
