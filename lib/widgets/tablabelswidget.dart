import 'package:flutter/material.dart';


class TabColorLabel extends StatelessWidget {
  final String label;
  final Color color;
  const TabColorLabel({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 110.0,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: color),
      child: Center(
        child: Text(
          label.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Lexend",
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
