import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final targetKey = GlobalKey();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            final tutorial = TutorialCoachMark(
              targets: [
                TargetFocus(
                  keyTarget: targetKey,
                  shape: ShapeLightFocus.RRect,
                  contents: [],
                ),
              ],
            );
            // working
            // tutorial.show(context: context);

            // not working
            tutorial.show(context: navigatorKey.currentContext!);
          },
          child: Text(
            key: targetKey,
            'Click here',
          ),
        ),
      ),
    );
  }
}
