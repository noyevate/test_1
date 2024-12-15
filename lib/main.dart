import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(TimeCounterApp());
}

class TimeCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimeCounterPage(),
    );
  }
}

class TimeCounterPage extends StatefulWidget {
  @override
  _TimeCounterPageState createState() => _TimeCounterPageState();
}

class _TimeCounterPageState extends State<TimeCounterPage> {
  late Timer _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _elapsed += Duration(milliseconds: 10);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _elapsed.inHours.toString().padLeft(2, '0');
    final minutes = (_elapsed.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_elapsed.inSeconds % 60).toString().padLeft(2, '0');
    final milliseconds = (_elapsed.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$hours:$minutes:$seconds:$milliseconds',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
