import 'package:flutter/material.dart';

class IconCheckboxWithLabel extends StatefulWidget {
  final Icon icon;
  final String label;
  IconCheckboxWithLabel({
    this.icon,
    this.label,
  });
  @override
  _IconCheckboxWithLabelState createState() => _IconCheckboxWithLabelState();
}

class _IconCheckboxWithLabelState extends State<IconCheckboxWithLabel> {
  bool isChecked = false;
  void toggle() => setState(() => isChecked = !isChecked);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: widget.icon,
          onPressed: toggle,
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