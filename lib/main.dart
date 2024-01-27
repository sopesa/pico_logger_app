import 'package:flutter/material.dart';
import 'package:pico_logger_app/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TempApp',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MainPage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   final Client client = http.Client();

//   MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<TemperatureData> tempData = [];
//   void _incrementCounter() async {
//     // allow = !allow;

//     var response = await widget.client.get(Uri.parse('http://192.168.0.192:80'));
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');

//     List<String> tempLogs = response.body.trim().split('\n');
//     int index = 0;
//     List<TemperatureData> tmpTempData = [];

//     tempLogs.forEach((tempLog) {
//       tmpTempData.add(TemperatureData(index, double.parse(tempLog)));
//       index++;
//     });

//     setState(() {
//       tempData = tmpTempData;
//     });
//   }

//   @override
//   Widget build(BuildContext context) => MainPage();
// }
