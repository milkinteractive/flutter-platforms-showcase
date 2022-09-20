import 'package:flutter/material.dart';
import 'package:railvis/app.dart';

class LargeScreenApp extends StatelessWidget {
  const LargeScreenApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Expanded(
        flex: 4,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: GaudeView(),
        ),
      ),
      Expanded(flex: 6, child: Container(color: Colors.blue))
    ]);
  }
}
