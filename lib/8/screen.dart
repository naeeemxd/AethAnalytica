import 'package:aeth_analatica/8/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: ${counterProvider.counter}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: counterProvider.increment,
              child: Text('Increment'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: counterProvider.decrement,
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}