import 'package:flutter/material.dart';

import 'package:railvis/extensions/context_extension.dart';
import 'package:railvis/utils/utils.dart';

import '../app.dart';
import 'kgaude_view.dart';

enum FontSizeType { unit, speed, minMax }

class GaudeView extends StatefulWidget {
  const GaudeView({
    Key? key,
  }) : super(key: key);

  @override
  State<GaudeView> createState() => _GaudeViewState();
}

class _GaudeViewState extends State<GaudeView>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  var start = 20.0;
  var end = 150.0;
  var tweenSequence = Tween<double>(begin: 20, end: 150);

  _unitFontSize(BuildContext context, FontSizeType type) {
    double fontSize = 48;
    switch (type) {
      case FontSizeType.unit:
        return fontSize / 2;
      case FontSizeType.minMax:
        return fontSize / 3;
      case FontSizeType.speed:
        return fontSize;
    }
  }

  @override
  void initState() {
    super.initState();
    var ms = Platform.isLinux ? 25000 : 2500;
    var duration = Duration(milliseconds: ms);
    controller = AnimationController(vsync: this, duration: duration);
    animation = tweenSequence.animate(controller)
      ..addListener(() {
        setState(() {});
        if (animation.value == end) {
          controller.reverse();
        } else if (animation.value == start) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.center,
      fit: BoxFit.fitHeight,
      child: SizedBox(
        width: 400,
        height: 400,
        child: KdGaugeView(
          key: ValueKey("GaudeView"),
          unitOfMeasurement: "Km/h",
          unitOfMeasurementTextStyle: TextStyle(
            color: Colors.white,
            fontSize: _unitFontSize(context, FontSizeType.unit),
            fontWeight: FontWeight.w600,
          ),
          speed: animation.value,
          speedTextStyle: TextStyle(
            color: Colors.white,
            fontSize: _unitFontSize(context, FontSizeType.speed),
            fontWeight: FontWeight.bold,
          ),
          minSpeed: 0,
          maxSpeed: 180,
          minMaxTextStyle: TextStyle(
            color: Colors.white,
            fontSize: _unitFontSize(context, FontSizeType.minMax),
          ),
          minMaxPadding: 8,
          gaugeWidth: 8,
          baseGaugeColor: Colors.transparent,
          inactiveGaugeColor: Colors.black87,
          activeGaugeColor: Colors.green,
          divisionCircleColors: Colors.white30,
          subDivisionCircleColors: Colors.white,
        ),
      ),
    );
  }
}
