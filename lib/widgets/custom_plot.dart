import 'package:flutter/widgets.dart';
import 'package:pico_logger_app/models/temperature_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// A simple widget representing a custom designed and configured plot of numbers
///
class CustomPlot extends StatelessWidget {
  final String axisTitleX;
  final String axisTitleY;

  const CustomPlot({super.key, required this.axisTitleX, required this.axisTitleY});

  @override
  Widget build(BuildContext context) => SfCartesianChart(
        primaryXAxis: NumericAxis(),
        primaryYAxis: NumericAxis(
          title: AxisTitle(
            text: axisTitleY,
            alignment: ChartAlignment.far,
          ),
          maximum: 35,
          minimum: 10,
        ),
        series: <ChartSeries>[
          // Renders line chart
          LineSeries<TemperatureData, int>(
            dataSource: [], // temp data from BLoC
            xValueMapper: (TemperatureData tempLog, _) => tempLog.sequence,
            yValueMapper: (TemperatureData tempLog, _) => tempLog.data,
          ),
        ],
      );
}
