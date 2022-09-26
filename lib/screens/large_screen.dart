// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:railvis/app.dart';

class LargeScreenApp extends StatelessWidget {
  const LargeScreenApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: Column(
          children: [
            Processvalues(),
            TimeView(),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: GaudeView(),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ConverterVerticalBar.withSampleData()),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: RailVisIcons.Row1(),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              child: RailVisIcons.Row2(),
            ),
            Expanded(flex: 1, child: Container())
          ],
        ),
      ),
      Expanded(flex: 1, child: MetroLinesPage())
    ]);
  }
}
