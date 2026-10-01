import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../widgets/physics_canvas.dart';
import '../widgets/simulation_controls.dart';

class WaveSimulation extends StatefulWidget {
  const WaveSimulation({super.key});
  @override State<WaveSimulation> createState()=>_WaveSimulationState();
}
class _WaveSimulationState extends State<WaveSimulation> with SingleTickerProviderStateMixin{
 late final AnimationController clock; double frequency=2, wavelength=2, amplitude=40, phase=0, speed=1; bool playing=true;
 @override void initState(){super.initState();clock=AnimationController(vsync:this,duration:const Duration(milliseconds:16))..addListener(()=>setState((){if(playing)phase+=.04*speed;}))..repeat();}
 @override void dispose(){clock.dispose();super.dispose();}
 double get waveSpeed=>frequency*wavelength;
 @override Widget build(BuildContext c)=>Column(children:[
   PhysicsCanvas(painter:_WavePainter(amplitude:amplitude,wavelength:wavelength,phase:phase)),
   const SizedBox(height:12),
   SimulationControls(playing:playing,onPlay:()=>setState(()=>playing=true),onPause:()=>setState(()=>playing=false),onReset:()=>setState(()=>phase=0),onStepBack:()=>setState(()=>phase-=.1),onStepForward:()=>setState(()=>phase+=.1),speed:speed,onSpeedChanged:(v)=>setState(()=>speed=v)),
   PhysicsSlider(label:'Frequency',value:frequency,min:.5,max:8,divisions:15,suffix:' Hz',onChanged:(v)=>setState(()=>frequency=v)),
   PhysicsSlider(label:'Wavelength',value:wavelength,min:.5,max:5,divisions:18,suffix:' m',onChanged:(v)=>setState(()=>wavelength=v)),
   PhysicsSlider(label:'Amplitude',value:amplitude,min:10,max:80,divisions:14,suffix:' px',onChanged:(v)=>setState(()=>amplitude=v)),
   Card(child:Padding(padding:const EdgeInsets.all(16),child:Text('v = fλ  →  ${frequency.toStringAsFixed(2)} × ${wavelength.toStringAsFixed(2)} = ${waveSpeed.toStringAsFixed(2)} m/s',style:const TextStyle(fontWeight:FontWeight.bold)))),
 ]);
}
class _WavePainter extends CustomPainter{
 final double amplitude,wavelength,phase;_WavePainter({required this.amplitude,required this.wavelength,required this.phase});
 @override void paint(Canvas c,Size s){final mid=s.height/2;final p=Paint()..color=Colors.indigo..strokeWidth=3;final path=Path();for(double x=0;x<=s.width;x+=2){final y=mid+amplitude*math.sin((2*math.pi*x/(wavelength*70))-phase);if(x==0)path.moveTo(x,y);else path.lineTo(x,y);}c.drawPath(path,p);c.drawLine(Offset.zero, Offset(s.width, mid), Paint()..color=Colors.grey);}
 @override bool shouldRepaint(covariant _WavePainter o)=>o.phase!=phase||o.amplitude!=amplitude||o.wavelength!=wavelength;
}
