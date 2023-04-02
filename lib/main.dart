import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TemperatureData {
  final int sequence;
  final num data;

  TemperatureData(this.sequence, this.data);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Client client = http.Client();

  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TemperatureData> tempData = [];
  void _incrementCounter() async {
    // allow = !allow;

    var response = await widget.client.get(Uri.parse('http://192.168.0.192:80'));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List<String> tempLogs = response.body.trim().split('\n');
    int index = 0;
    List<TemperatureData> tmpTempData = [];

    tempLogs.forEach((tempLog) {
      tmpTempData.add(TemperatureData(index, double.parse(tempLog)));
      index++;
    });

    setState(() {
      tempData = tmpTempData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SfCartesianChart(
          primaryXAxis: NumericAxis(),
          primaryYAxis: NumericAxis(
            title: AxisTitle(
              text: '°C',
              alignment: ChartAlignment.far,
            ),
            maximum: 35,
            minimum: 10,
          ),
          series: <ChartSeries>[
            // Renders line chart
            LineSeries<TemperatureData, int>(
              dataSource: tempData,
              xValueMapper: (TemperatureData tempLog, _) => tempLog.sequence,
              yValueMapper: (TemperatureData tempLog, _) => tempLog.data,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.thermostat),
      ),
    );
  }
}
