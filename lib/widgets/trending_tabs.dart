import 'package:flutter/material.dart';

class TrendingTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 75,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text('Music'),
              color: Colors.blueAccent,
              onPressed: () {},
            ),
            SizedBox(width: 16),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text('Sports'),
              color: Colors.greenAccent,
              onPressed: () {},
            ),
            SizedBox(width: 16),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text('Games'),
              color: Colors.redAccent,
              onPressed: () {},
            ),
            SizedBox(width: 16),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text('Education'),
              color: Colors.tealAccent,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}