import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../widgets/physics_canvas.dart';
import '../widgets/simulation_controls.dart';

class RefractionSimulation extends StatefulWidget {
  const RefractionSimulation({super.key});
  @override State<RefractionSimulation> createState()=>_RefractionSimulationState();
}
class _RefractionSimulationState extends State<RefractionSimulation>{
 double angle=35,n1=1,n2=1.33;
 double get r{final x=n1*math.sin(angle*math.pi/180)/n2;return math.asin(x.clamp(-1,1))*180/math.pi;}
 @override Widget build(BuildContext c)=>Column(children:[
  PhysicsCanvas(painter:_RayPainter(angle:angle,refracted:r)),
  const SizedBox(height:12),
  PhysicsSlider(label:'Incident angle',value:angle,min:0,max:80,divisions:80,suffix:'°',onChanged:(v)=>setState(()=>angle=v)),
  PhysicsSlider(label:'Medium 1 index',value:n1,min:1,max:2,divisions:20,onChanged:(v)=>setState(()=>n1=v)),
  PhysicsSlider(label:'Medium 2 index',value:n2,min:1,max:2,divisions:20,onChanged:(v)=>setState(()=>n2=v)),
  Card(child:Padding(padding:const EdgeInsets.all(16),child:Text('Calculated refracted angle ≈ ${r.toStringAsFixed(2)}°',style:const TextStyle(fontWeight:FontWeight.bold)))),
 ]);
}
class _RayPainter extends CustomPainter{
 final double angle,refracted;_RayPainter({required this.angle,required this.refracted});
 @override void paint(Canvas c,Size s){final center=Offset(s.width/2,s.height/2);final p=Paint()..strokeWidth=3; c.drawLine(Offset(0,center.dy),Offset(s.width,center.dy),Paint()..color=Colors.grey..strokeWidth=2);c.drawLine(Offset(center.dx,20),Offset(center.dx,s.height-20),Paint()..color=Colors.grey..strokeWidth=2);
 final a=angle*math.pi/180;final b=refracted*math.pi/180;
 final inc=Offset(center.dx-250*math.sin(a),center.dy-250*math.cos(a));final refr=Offset(center.dx+250*math.sin(b),center.dy+250*math.cos(b));
 p..color=Colors.red;c.drawLine(inc,center,p);p..color=Colors.indigo;c.drawLine(center,refr,p);}
 @override bool shouldRepaint(covariant _RayPainter o)=>o.angle!=angle||o.refracted!=refracted;
}
