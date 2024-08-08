import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HealthAnalysisPage extends StatefulWidget {
  const HealthAnalysisPage({Key? key}) : super(key: key);

  @override
  _HealthAnalysisPageState createState() => _HealthAnalysisPageState();
}

class _HealthAnalysisPageState extends State<HealthAnalysisPage> {
  double? _sugarContent;
  int? _stepsNeeded;
  List<FlSpot> _sugarLevelData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Daily Blood Pressure',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildBloodPressureChart(),
            SizedBox(height: 20),
            Text(
              'Blood Count Analysis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildBloodCountChart(),
            SizedBox(height: 20),
            Text(
              'Medical Analysis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Add your medical analysis content here...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  _sugarContent = double.tryParse(value);
                  if (_sugarContent != null) {
                    // Calculate steps needed
                    _stepsNeeded = ((_sugarContent! * 16) / 0.1).ceil();
                    // Update sugar level chart
                    _updateSugarLevelChart();
                  } else {
                    _stepsNeeded = null;
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Sugar Content',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            if (_stepsNeeded != null)
              Container(
                padding: EdgeInsets.all(8),
                color:
                    _sugarContent! <= 120 ? Colors.green[100] : Colors.red[100],
                child: Text(
                  'Steps needed: $_stepsNeeded',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            SizedBox(height: 20),
            Text(
              'Sugar Level',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildSugarLevelChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodPressureChart() {
    // Example blood pressure data
    final List<FlSpot> data = [
      FlSpot(0, 120),
      FlSpot(1, 122),
      FlSpot(2, 118),
      FlSpot(3, 124),
      FlSpot(4, 130),
      FlSpot(5, 128),
      FlSpot(6, 126),
    ];

    return Expanded(
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: data,
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
          backgroundColor: Colors.green[100],
        ),
      ),
    );
  }

  Widget _buildBloodCountChart() {
    // Example blood count data
    final List<FlSpot> data = [
      FlSpot(0, 12),
      FlSpot(1, 11.5),
      FlSpot(2, 11.8),
      FlSpot(3, 12.2),
      FlSpot(4, 11.9),
      FlSpot(5, 11.7),
      FlSpot(6, 12.1),
    ];

    return Expanded(
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: data,
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
          backgroundColor: Colors.green[100],
        ),
      ),
    );
  }

  Widget _buildSugarLevelChart() {
    return Expanded(
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: _sugarLevelData,
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
          backgroundColor: Colors.green[100],
        ),
      ),
    );
  }

  void _updateSugarLevelChart() {
    setState(() {
      _sugarLevelData = [
        FlSpot(0, 120),
        FlSpot(1, 125),
        FlSpot(2, 123),
        FlSpot(3, 128),
        FlSpot(4, 130),
        FlSpot(5, 127),
        FlSpot(6, 125),
      ];
    });
  }
}
