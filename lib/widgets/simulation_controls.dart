import 'package:flutter/material.dart';

class SimulationControls extends StatelessWidget {
  final bool playing;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onReset;
  final VoidCallback onStepBack;
  final VoidCallback onStepForward;
  final double speed;
  final ValueChanged<double> onSpeedChanged;

  const SimulationControls({
    super.key,
    required this.playing,
    required this.onPlay,
    required this.onPause,
    required this.onReset,
    required this.onStepBack,
    required this.onStepForward,
    required this.speed,
    required this.onSpeedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 4,
          children: [
            IconButton(tooltip: 'Step back', onPressed: onStepBack, icon: const Icon(Icons.skip_previous_rounded)),
            IconButton.filledTonal(tooltip: 'Play', onPressed: onPlay, icon: const Icon(Icons.play_arrow_rounded)),
            IconButton.filledTonal(tooltip: 'Pause', onPressed: onPause, icon: const Icon(Icons.pause_rounded)),
            IconButton(tooltip: 'Step forward', onPressed: onStepForward, icon: const Icon(Icons.skip_next_rounded)),
            IconButton(tooltip: 'Reset', onPressed: onReset, icon: const Icon(Icons.restart_alt_rounded)),
          ],
        ),
        const SizedBox(height: 6),
        SegmentedButton<double>(
          segments: const [
            ButtonSegment(value: .25, label: Text('0.25x')),
            ButtonSegment(value: .5, label: Text('0.5x')),
            ButtonSegment(value: 1, label: Text('1x')),
            ButtonSegment(value: 2, label: Text('2x')),
          ],
          selected: {speed},
          onSelectionChanged: (v) => onSpeedChanged(v.first),
        ),
      ],
    );
  }
}

class PhysicsSlider extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final String suffix;
  final ValueChanged<double> onChanged;

  const PhysicsSlider({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    this.divisions,
    this.suffix = '',
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600))),
          Text('${value.toStringAsFixed(2)}$suffix'),
        ]),
        Slider(value: value, min: min, max: max, divisions: divisions, onChanged: onChanged),
      ],
    );
  }
}
