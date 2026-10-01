import 'package:flutter/material.dart';

class PhysicsCanvas extends StatelessWidget {
  final CustomPainter painter;
  final double height;

  const PhysicsCanvas({super.key, required this.painter, this.height = 300});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(.45),
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: CustomPaint(painter: painter),
    );
  }
}
