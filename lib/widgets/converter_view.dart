import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';

class ConverterVerticalBar extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  ConverterVerticalBar(this.seriesList, {this.animate = false});

  /// Creates a [BarChart] with sample data and no transition.
  factory ConverterVerticalBar.withSampleData() {
    return new ConverterVerticalBar(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // [BarLabelDecorator] will automatically position the label
  // inside the bar if the label will fit. If the label will not fit,
  // it will draw outside of the bar.
  // Labels can always display inside or outside using [LabelPosition].
  //
  // Text style for inside / outside can be controlled independently by setting
  // [insideLabelStyleSpec] and [outsideLabelStyleSpec].
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ConverterValue, String>> _createSampleData() {
    final data = [
      new ConverterValue('SR 1', 80),
      new ConverterValue('SR 2', 80),
    ];

    return [
      new charts.Series<ConverterValue, String>(
          id: 'Stromrichter',
          domainFn: (ConverterValue converter, _) => converter.name,
          measureFn: (ConverterValue converter, _) => converter.value,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (ConverterValue converter, _) =>
              '${converter.value.toString()}%')
    ];
  }
}

class ConverterHorizontalBar extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  ConverterHorizontalBar(this.seriesList, {this.animate = false});

  /// Creates a [BarChart] with sample data and no transition.
  factory ConverterHorizontalBar.withSampleData() {
    return ConverterHorizontalBar(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // [BarLabelDecorator] will automatically position the label
  // inside the bar if the label will fit. If the label will not fit and the
  // area outside of the bar is larger than the bar, it will draw outside of the
  // bar. Labels can always display inside or outside using [LabelPosition].
  //
  // Text style for inside / outside can be controlled independently by setting
  // [insideLabelStyleSpec] and [outsideLabelStyleSpec].
  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator:   charts.BarLabelDecorator(
      //          insideLabelStyleSpec:   charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec:   charts.TextStyleSpec(...)),
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      // Hide domain axis.
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ConverterValue, String>> _createSampleData() {
    final data = [
      ConverterValue('SR 1', 80),
      ConverterValue('SR 2', 80),
    ];

    return [
      charts.Series<ConverterValue, String>(
          id: 'Stromrichter',
          domainFn: (ConverterValue sales, _) => sales.name,
          measureFn: (ConverterValue sales, _) => sales.value,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (ConverterValue sales, _) =>
              '${sales.name}: ${sales.value.toString()}%')
    ];
  }
}

/// Sample ordinal data type.
class ConverterValue {
  final String name;
  final int value;

  ConverterValue(this.name, this.value);
}
