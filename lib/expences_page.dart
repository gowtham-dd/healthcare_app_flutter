import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  TextEditingController _contentController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  List<Map<String, String>> _expenseList = [];

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
              'Monthly Expenses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildExpensesChart(),
            SizedBox(height: 20),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _addExpense();
              },
              child: Text('Send'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _expenseList.length,
                itemBuilder: (context, index) {
                  return _buildExpenseContainer(_expenseList[index]['content']!,
                      double.parse(_expenseList[index]['amount']!));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpensesChart() {
    return Expanded(
      child: LineChart(
        _expensesChartData(),
      ),
    );
  }

  LineChartData _expensesChartData() {
    return LineChartData(
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      gridData: FlGridData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 1000), // January
            FlSpot(1, 1500), // February
            FlSpot(2, 1200), // March
            FlSpot(3, 2000), // April
            FlSpot(4, 1800), // May
            FlSpot(5, 2200), // June
            FlSpot(6, 1700), // July
          ],
          isCurved: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
      backgroundColor: Colors.green[100],
    );
  }

  void _addExpense() {
    setState(() {
      String content = _contentController.text;
      String amount = _amountController.text;
      _expenseList.add({'content': content, 'amount': amount});
      _contentController.clear();
      _amountController.clear();
    });
  }

  Widget _buildExpenseContainer(String content, double amount) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Content: $content',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Amount: $amount',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ExpensesPage(),
  ));
}
