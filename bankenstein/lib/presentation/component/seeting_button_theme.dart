import 'package:flutter/material.dart';

class SeetingButtonTheme extends StatelessWidget {
  const SeetingButtonTheme({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
  });

  final String text;
  final void Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
