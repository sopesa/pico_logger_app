import 'package:flutter/material.dart';
import 'package:pico_logger_app/widgets/custom_plot.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp App'),
      ),
      body: Center(
        child: CustomPlot(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.thermostat),
      ),
    );
  }
}