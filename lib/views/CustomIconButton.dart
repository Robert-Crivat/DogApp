import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final Color initialColor;
  final Color tappedColor;

  const CustomIconButton({
    Key? key,
    required this.icon,
    this.initialColor = Colors.white,
    this.tappedColor = Colors.red,
  }) : super(key: key);

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.initialColor;
  }

  void _toggleColor() {
    setState(() {
      _currentColor = _currentColor == widget.initialColor ? widget.tappedColor : widget.initialColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget.icon, color: _currentColor),
      onPressed: _toggleColor,
    );
  }
}