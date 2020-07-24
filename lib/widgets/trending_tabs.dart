import 'package:flutter/material.dart';

class TrendingTabs extends StatelessWidget {
  final void Function() musicOnPressed;
  final void Function() sportsOnPressed;
  final void Function() gamesOnPressed;
  final void Function() comedyOnPressed;

  TrendingTabs({
    this.musicOnPressed,
    this.sportsOnPressed,
    this.gamesOnPressed,
    this.comedyOnPressed,
  });

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
              onPressed: musicOnPressed,
            ),
            SizedBox(width: 16),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text('Sports'),
              color: Colors.greenAccent,
              onPressed: sportsOnPressed,
            ),
            SizedBox(width: 16),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text('Games'),
              color: Colors.redAccent,
              onPressed: gamesOnPressed,
            ),
            SizedBox(width: 16),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text('Comedy'),
              color: Colors.tealAccent,
              onPressed: comedyOnPressed,
            ),
          ],
        ),
      ),
    );
  }
}