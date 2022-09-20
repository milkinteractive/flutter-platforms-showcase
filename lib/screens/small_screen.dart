import 'package:flutter/material.dart';

import '../app.dart';

class SmallScreenApp extends StatelessWidget {
  const SmallScreenApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: GaudeView(),
          )),
      Expanded(flex: 2, child: Container(color: Colors.blue))
    ]);
  }
}
