import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../widgets/physics_canvas.dart';
import '../widgets/simulation_controls.dart';

class NewtonSimulation extends StatefulWidget {
  final int law;
  const NewtonSimulation({super.key, this.law = 2});
  @override State<NewtonSimulation> createState() => _NewtonSimulationState();
}

class _NewtonSimulationState extends State<NewtonSimulation> with SingleTickerProviderStateMixin {
  late final AnimationController _clock;
  double mass = 5, force = 20, friction = 0, velocity = 0, speed = 1;
  bool playing = false;
  @override void initState() {
    super.initState();
    _clock = AnimationController(vsync: this, duration: const Duration(milliseconds: 16))
      ..addListener(() { if (playing) setState(() { velocity += acceleration * .016 * speed; }); })..repeat();
  }
  @override void dispose(){_clock.dispose();super.dispose();}
  double get netForce => math.max(0, force - friction);
  double get acceleration => netForce / mass;
  void reset()=>setState(()=>velocity=0);
  @override Widget build(BuildContext context){
    return Column(children:[
      PhysicsCanvas(painter:_CartPainter(velocity:velocity, force:force, acceleration:acceleration)),
      const SizedBox(height:12),
      SimulationControls(playing:playing,onPlay:()=>setState(()=>playing=true),onPause:()=>setState(()=>playing=false),onReset:reset,onStepBack:()=>setState(()=>velocity=math.max(0,velocity-.2)),onStepForward:()=>setState(()=>velocity+=.2),speed:speed,onSpeedChanged:(v)=>setState(()=>speed=v)),
      const SizedBox(height:12),
      PhysicsSlider(label:'Mass',value:mass,min:1,max:20,divisions:19,suffix:' kg',onChanged:(v)=>setState(()=>mass=v)),
      PhysicsSlider(label:'Applied Force',value:force,min:0,max:100,divisions:100,suffix:' N',onChanged:(v)=>setState(()=>force=v)),
      PhysicsSlider(label:'Friction',value:friction,min:0,max:50,divisions:50,suffix:' N',onChanged:(v)=>setState(()=>friction=v)),
      Row(children:[
        Expanded(child:_Value('Force','${netForce.toStringAsFixed(1)} N')),
        Expanded(child:_Value('Mass','${mass.toStringAsFixed(1)} kg')),
        Expanded(child:_Value('Acceleration','${acceleration.toStringAsFixed(2)} m/s²')),
      ]),
    ]);
  }
}
class _Value extends StatelessWidget{final String a,b;const _Value(this.a,this.b);@override Widget build(BuildContext c)=>Card(child:Padding(padding:const EdgeInsets.all(10),child:Column(children:[Text(a),Text(b,style:const TextStyle(fontWeight:FontWeight.bold))])));}
class _CartPainter extends CustomPainter{
 final double velocity,force,acceleration; _CartPainter({required this.velocity,required this.force,required this.acceleration});
 @override void paint(Canvas c,Size s){
  final y=s.height*.55; final x=(s.width*.2+velocity*8)%(s.width*.65)+s.width*.1;
  c.drawLine(Offset.zero, Offset(s.width, y + 45), Paint()..strokeWidth=4);
  c.drawRect(Rect.fromLTWH(x,y-35,100,70),Paint()..color=Colors.indigo);
  final p=Paint()..color=Colors.red..strokeWidth=3;
  c.drawLine(Offset(x+100,y),Offset(x+160,y),p);
  final t=TextPainter(text:TextSpan(text:'F = ${force.toStringAsFixed(1)} N',style:const TextStyle(fontSize:14)),textDirection:TextDirection.ltr)..layout();t.paint(c,Offset(x+105,y-30));
  final a=TextPainter(text:TextSpan(text:'a = ${acceleration.toStringAsFixed(2)} m/s²',style:const TextStyle(fontSize:14)),textDirection:TextDirection.ltr)..layout();a.paint(c,Offset(12,12));
 }
 @override bool shouldRepaint(covariant _CartPainter o)=>o.velocity!=velocity||o.force!=force||o.acceleration!=acceleration;
}
