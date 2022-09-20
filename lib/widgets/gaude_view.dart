import 'package:flutter/material.dart';

import 'package:railvis/extensions/context_extension.dart';

import 'kgaude_view.dart';

GlobalKey<KdGaugeViewState> key = GlobalKey<KdGaugeViewState>();

class GaudeView extends StatelessWidget {
  const GaudeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KdGaugeView(
      key: key,
      unitOfMeasurement: "Km/h",
      unitOfMeasurementTextStyle: TextStyle(
        color: Colors.white,
        fontSize: context.responsiveValue(
            mobile: 24.0, tablet: 45.0, desktop: 24.0, web: 60.0),
        fontWeight: FontWeight.w600,
      ),
      speed: 120,
      speedTextStyle: TextStyle(
        color: Colors.white,
        fontSize: context.responsiveValue(
            mobile: 45.0, tablet: 60.0, desktop: 48.0, web: 60.0),
        fontWeight: FontWeight.bold,
      ),
      minSpeed: 0,
      maxSpeed: 180,
      minMaxTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      minMaxPadding: context.responsiveValue(
          mobile: 4.0, tablet: 4.0, desktop: 5.0, web: 10.0),
      gaugeWidth: 8,
      baseGaugeColor: Colors.transparent,
      inactiveGaugeColor: Colors.black87,
      activeGaugeColor: Colors.green,
      divisionCircleColors: Colors.white30,
      subDivisionCircleColors: Colors.white,
      animate: true,
    );
  }
}
