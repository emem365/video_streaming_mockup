import 'package:flutter/material.dart';

class IconButtonWithLabel extends StatefulWidget {
  final Icon icon;
  final String label;
  final bool toggleOnTap;
  final void Function() onPressed;
  IconButtonWithLabel({
    this.icon,
    this.label,
    this.toggleOnTap = true,
    this.onPressed,
  });
  @override
  _IconButtonWithLabelState createState() => _IconButtonWithLabelState();
}

class _IconButtonWithLabelState extends State<IconButtonWithLabel> {
  bool isChecked = false;
  void toggle() => setState(() => isChecked = !isChecked);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: widget.icon,
          onPressed: widget.toggleOnTap ? toggle : widget.onPressed,
          color: isChecked ? Colors.blue : Colors.black54,
        ),
        Text(
          widget.label,
          style: Theme.of(context).textTheme.caption.copyWith(
                fontSize: 12,
                color: isChecked ? Colors.blue : Colors.black54,
              ),
        ),
      ],
    );
  }
}
