// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../app.dart';

class SmallScreenApp extends StatelessWidget {
  const SmallScreenApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Processvalues(),
        TimeView(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: GaudeView(),
        ),
        SizedBox(height: 200, child: ConverterHorizontalBar.withSampleData()),
        SizedBox(
          height: 20,
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
        )
      ]),
    );
  }
}
