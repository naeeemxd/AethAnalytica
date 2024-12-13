

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
    ),
  );
}

class RatingBar extends StatefulWidget {
  final int rating;
  final int maxRating;
  final Function(int) onRatingChanged;
  final double size;
  final Color color;

  const RatingBar({
    Key? key,
    required this.rating,
    required this.maxRating,
    required this.onRatingChanged,
    this.size = 24,
    this.color = Colors.yellow,
  }) : super(key: key);

  @override
  _RatingBarState createState() => _RatingBarState();
}
class _RatingBarState extends State<RatingBar> {
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.maxRating,
            (index) => GestureDetector(
          onTap: () {
            widget.onRatingChanged(index + 1);
            setState(() {
              _rating = index + 1;
            });},
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            size: widget.size,
            color: index < _rating ? widget.color : Colors.grey,
          ), ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rating Bar Example',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rate Me!',
              style: TextStyle(fontSize: 36, color: Colors.orange ),
            ),
            SizedBox(height: 16),
            RatingBar(
              rating: 3,
              maxRating: 5,
              onRatingChanged: (rating) {
                print('Rating changed: $rating');
              },
              size: 48,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

