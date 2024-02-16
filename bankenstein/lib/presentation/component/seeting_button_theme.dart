import 'package:flutter/material.dart';

class SeetingButtonTheme extends StatelessWidget {
  const SeetingButtonTheme(
      {super.key, required this.onTap, required this.color});
  final void Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        child: const Center(
          child: Text("Change theme"),
        ),
      ),
    );
  }
}
