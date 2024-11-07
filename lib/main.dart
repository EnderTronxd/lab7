import 'package:flutter/material.dart';

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
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomeP  ageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width = 50.0;
  double _height = 80.0;
  double _radius = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        backgroundColor: Colors.purple[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SliderRow(
              label: 'Width',
              value: _width,
              min: 50,
              max: 200,
              onChanged: (value) {
                setState(() {
                  _width = value;
                });
              },
            ),
            SliderRow(
              label: 'Height',
              value: _height,
              min: 50,
              max: 200,
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
              },
            ),
            SliderRow(
              label: 'Radius',
              value: _radius,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _radius = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_radius),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderRow extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const SliderRow({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ${value.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16),
          ),
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
              activeColor: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
