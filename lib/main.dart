import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RailVis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Builder(builder: ((context) {
        return Material(
          child: SafeArea(
            left: true,
            right: true,
            minimum: const EdgeInsets.all(10),
            child: OrientationBuilder(builder: ((context, orientation) {
              return context.isPhone
                  ? const SmallScreenApp()
                  : const LargeScreenApp();
            })),
          ),
        );
      })),
    );
  }
}
