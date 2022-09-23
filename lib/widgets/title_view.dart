import 'package:flutter/material.dart';

class TimeView extends StatelessWidget {
  const TimeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Text("12:55"),
    );
  }
}

class Processvalues extends StatelessWidget {
  const Processvalues({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Text(
        "Prozesswerte",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
