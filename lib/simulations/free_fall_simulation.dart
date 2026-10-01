import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../widgets/physics_canvas.dart';
import '../widgets/simulation_controls.dart';

class FreeFallSimulation extends StatefulWidget {
  const FreeFallSimulation({super.key});
  @override State<FreeFallSimulation> createState() => _FreeFallSimulationState();
}

class _FreeFallSimulationState extends State<FreeFallSimulation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double height = 20, u = 0, g = 9.8, t = 0, speed = 1;
  bool playing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 16))
      ..addListener(() {
        if (!playing) return;
        setState(() {
          t += .016 * speed;
          final s = u * t + .5 * g * t * t;
          if (s >= height) {
            t = math.sqrt(math.max(0, 2 * height / g));
            playing = false;
          }
        });
      });
    _controller.repeat();
  }

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  double get distance => math.min(height, u * t + .5 * g * t * t);
  double get velocity => u + g * t;

  void reset() => setState(() { t = 0; playing = false; });
  void step(double dt) => setState(() { t = math.max(0, t + dt); });

  @override
  Widget build(BuildContext context) {
    final elapsed = t;
    return Column(children: [
      PhysicsCanvas(painter: _FallPainter(progress: distance / height, velocity: velocity)),
      const SizedBox(height: 16),
      SimulationControls(
        playing: playing,
        onPlay: () => setState(() => playing = true),
        onPause: () => setState(() => playing = false),
        onReset: reset,
        onStepBack: () => step(-.1),
        onStepForward: () => step(.1),
        speed: speed,
        onSpeedChanged: (v) => setState(() => speed = v),
      ),
      const SizedBox(height: 12),
      PhysicsSlider(label: 'Height', value: height, min: 5, max: 50, divisions: 45, suffix: ' m', onChanged: (v) => setState(() { height = v; reset(); })),
      PhysicsSlider(label: 'Initial velocity', value: u, min: 0, max: 20, divisions: 40, suffix: ' m/s', onChanged: (v) => setState(() { u = v; reset(); })),
      PhysicsSlider(label: 'Gravity', value: g, min: 1, max: 15, divisions: 28, suffix: ' m/s²', onChanged: (v) => setState(() { g = v; reset(); })),
      Row(children: [
        Expanded(child: _ValueCard('Time', '${elapsed.toStringAsFixed(2)} s')),
        const SizedBox(width: 8),
        Expanded(child: _ValueCard('Distance', '${distance.toStringAsFixed(2)} m')),
        const SizedBox(width: 8),
        Expanded(child: _ValueCard('Velocity', '${velocity.toStringAsFixed(2)} m/s')),
      ]),
    ]);
  }
}

class _ValueCard extends StatelessWidget {
  final String a, b;
  const _ValueCard(this.a, this.b);
  @override Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(children: [Text(a), const SizedBox(height: 4), Text(b, style: const TextStyle(fontWeight: FontWeight.bold))])));
}

class _FallPainter extends CustomPainter {
  final double progress, velocity;
  _FallPainter({required this.progress, required this.velocity});
  @override
  void paint(Canvas c, Size s) {
    final p = Paint()..strokeWidth = 3;
    final x = s.width * .5;
    final top = 35.0, bottom = s.height - 35;
    c.drawLine(Offset(0, bottom), Offset(s.width, bottom), p);
    c.drawLine(Offset(x, top), Offset(x, bottom), p);
    final y = top + (bottom - top) * progress.clamp(0, 1);
    c.drawCircle(Offset(x, y), 18, Paint()..color = Colors.indigo);
    p..color = Colors.red..strokeWidth = math.max(2, velocity / 3);
    c.drawLine(Offset(x + 35, y), Offset(x + 35, math.min(bottom, y + 40 + velocity * 2)), p);
    final tp = TextPainter(text: TextSpan(text: 'v = ${velocity.toStringAsFixed(1)} m/s', style: const TextStyle(fontSize: 14)), textDirection: TextDirection.ltr)..layout();
    tp.paint(c, Offset(x + 45, y));
  }
  @override bool shouldRepaint(covariant _FallPainter old) => old.progress != progress || old.velocity != velocity;
}
