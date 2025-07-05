import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Productivity Counter'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Counter Icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.thumb_up,
                  size: 40,
                  color: Colors.blue[600],
                ),
              ),
              SizedBox(height: 30),
              
              // Counter Label
              Text(
                'Tasks Completed',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),
              
              // Counter Value
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(75),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$_counter',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[600],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              
              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Decrement Button
                  FloatingActionButton(
                    onPressed: _decrementCounter,
                    heroTag: "decrement",
                    backgroundColor: Colors.red[400],
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                  
                  // Reset Button
                  FloatingActionButton(
                    onPressed: _resetCounter,
                    heroTag: "reset",
                    backgroundColor: Colors.grey[600],
                    child: Icon(Icons.refresh, color: Colors.white),
                  ),
                  
                  // Increment Button
                  FloatingActionButton(
                    onPressed: _incrementCounter,
                    heroTag: "increment",
                    backgroundColor: Colors.green[400],
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 30),
              
              // Motivational Text
              if (_counter > 0)
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green[200]!),
                  ),
                  child: Text(
                    _counter == 1 
                        ? 'Great start! Keep going! 🎉'
                        : _counter < 5 
                            ? 'You\'re building momentum! 💪'
                            : _counter < 10
                                ? 'You\'re on fire! 🔥'
                                : 'Absolutely amazing! You\'re a productivity master! 🏆',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green[700],
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}