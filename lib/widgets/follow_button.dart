import 'package:flutter/material.dart';

class FollowButton extends StatefulWidget {
  final bool initiallyFollowed;
  FollowButton({this.initiallyFollowed});
  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool _state;
  void toggleState() => setState(() => _state = !_state);
  @override
  void initState() {
    super.initState();
    _state = widget.initiallyFollowed;
  }

  @override
  Widget build(BuildContext context) {
    return _state
        ? RaisedButton(
            child: Text('FOLLOWING'),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: toggleState,
          )
        : OutlineButton(
            onPressed: toggleState,
            child: Text('   FOLLOW   '),
            color: Colors.black87,
            borderSide: BorderSide(
              width: 2,
            ),
          );
  }
}