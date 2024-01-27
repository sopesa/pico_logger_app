import 'package:flutter/material.dart';
import 'package:pico_logger_app/widgets/custom_button.dart';
import 'package:pico_logger_app/widgets/custom_plot.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp App'),
      ),
      body: const Center(
        child: CustomPlot(
          axisTitleX: 'time',
          axisTitleY: 'C°',
        ),
      ),
      floatingActionButton: CustomButton(),
    );
  }
}
