import 'dart:async';
import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  bool _isTimerRunning = false;
  late Timer _timer;
  late String _selectedImageUrl;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 20),
            _buildExerciseContainer('Jumping Jacks',
                'https://www.wikihow.com/images/thumb/9/94/Perform-Jumping-Jacks-Step-4-Version-4.jpg/v4-460px-Perform-Jumping-Jacks-Step-4-Version-4.jpg.webp'),
            _buildExerciseContainer('Push-ups',
                'https://th-i.thgim.com/public/sci-tech/health/vsuju8/article34301845.ece/alternates/FREE_1200/10MPHowto1'),
            _buildExerciseContainer('Squats',
                'https://www.inspireusafoundation.org/wp-content/uploads/2022/04/squat-incorrect-knees.gif'),
            _buildExerciseContainer('Lunges',
                'https://www.womensrunning.com/wp-content/uploads/2020/06/giant-walking-lunge.jpg?width=668'),
            _buildExerciseContainer('Plank',
                'https://fitnessprogramer.com/wp-content/uploads/2021/02/plank.gif'),
            _buildExerciseContainer('High Knees',
                'https://t3.ftcdn.net/jpg/03/79/40/84/360_F_379408418_PGMXzUfreC7MHGsPzAonjAS0q6Axhs1w.jpg'),
            _buildExerciseContainer('Burpees',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBU_49ji3T7ngYlgetMqs8vLGBtgdqmzky7KJ7dRESUg&s'),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Text(
            'Today\'s Set',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildExerciseContainer(String exerciseName, String imageUrl) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedImageUrl = imageUrl;
        });
        _showTimerDialog(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              exerciseName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Image.network(
              imageUrl,
              height: 60,
              width: 60,
            ),
          ],
        ),
      ),
    );
  }

  void _showTimerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exercise Timer'),
          content: TimerWidget(imageUrl: _selectedImageUrl),
        );
      },
    );
  }
}

class TimerWidget extends StatefulWidget {
  final String imageUrl;

  TimerWidget({required this.imageUrl});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  bool _isTimerRunning = false;
  late Timer _timer;
  int _secondsRemaining = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          widget.imageUrl,
          height: 100,
          width: 100,
        ),
        SizedBox(height: 20),
        Text(
          _secondsRemaining.toString(),
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _startTimer();
              },
              child: Text('Start'),
            ),
            ElevatedButton(
              onPressed: () {
                _stopTimer();
              },
              child: Text('Stop'),
            ),
          ],
        ),
      ],
    );
  }

  void _startTimer() {
    if (!_isTimerRunning) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_secondsRemaining > 0) {
            _secondsRemaining--;
          } else {
            _timer.cancel();
          }
        });
      });
      _isTimerRunning = true;
    }
  }

  void _stopTimer() {
    _timer.cancel();
    _isTimerRunning = false;
  }
}

void main() {
  runApp(MaterialApp(
    home: ExercisePage(),
  ));
}
