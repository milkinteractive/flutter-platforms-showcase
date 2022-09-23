import 'package:flutter/material.dart';

import 'package:railvis/extensions/context_extension.dart';

import 'kgaude_view.dart';

GlobalKey<KdGaugeViewState> key = GlobalKey<KdGaugeViewState>();

enum FontSizeType { unit, speed, minMax }

class GaudeView extends StatelessWidget {
  const GaudeView({
    Key? key,
  }) : super(key: key);

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
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.center,
      fit: BoxFit.fitHeight,
      child: SizedBox(
        width: 400,
        height: 400,
        child: KdGaugeView(
          key: key,
          unitOfMeasurement: "Km/h",
          unitOfMeasurementTextStyle: TextStyle(
            color: Colors.white,
            fontSize: _unitFontSize(context, FontSizeType.unit),
            fontWeight: FontWeight.w600,
          ),
          speed: 120,
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
          animate: true,
        ),
      ),
    );
  }
}
