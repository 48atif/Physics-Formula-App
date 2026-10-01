import 'package:flutter/material.dart';
import '../widgets/physics_canvas.dart';
import '../widgets/simulation_controls.dart';

class OhmSimulation extends StatefulWidget {
  const OhmSimulation({super.key});
  @override State<OhmSimulation> createState()=>_OhmSimulationState();
}
class _OhmSimulationState extends State<OhmSimulation>{
 double voltage=12,resistance=6;
 double get current=>voltage/resistance;
 @override Widget build(BuildContext c)=>Column(children:[
  PhysicsCanvas(painter:_CircuitPainter(current:current)),
  const SizedBox(height:12),
  PhysicsSlider(label:'Voltage',value:voltage,min:1,max:24,divisions:23,suffix:' V',onChanged:(v)=>setState(()=>voltage=v)),
  PhysicsSlider(label:'Resistance',value:resistance,min:1,max:20,divisions:38,suffix:' Ω',onChanged:(v)=>setState(()=>resistance=v)),
  Card(child:Padding(padding:const EdgeInsets.all(16),child:Text('V = IR  →  I = V/R = ${current.toStringAsFixed(2)} A',style:const TextStyle(fontWeight:FontWeight.bold)))),
 ]);
}
class _CircuitPainter extends CustomPainter{
 final double current;_CircuitPainter({required this.current});
 @override void paint(Canvas c,Size s){final p=Paint()..style=PaintingStyle.stroke..strokeWidth=4;final y=s.height/2;c.drawRect(Rect.fromCenter(center:Offset(s.width*.25,y),width:90,height:70),p);c.drawRect(Rect.fromCenter(center:Offset(s.width*.65,y),width:90,height:70),p);c.drawLine(Offset(s.width*.25+45,y-35),Offset(s.width*.65-45,y-35),p);c.drawLine(Offset(s.width*.25+45,y+35),Offset(s.width*.65-45,y+35),p);final t=TextPainter(text:TextSpan(text:'I = ${current.toStringAsFixed(2)} A',style:const TextStyle(fontSize:18,fontWeight:FontWeight.bold)),textDirection:TextDirection.ltr)..layout();t.paint(c,Offset(12,12));}
 @override bool shouldRepaint(covariant _CircuitPainter o)=>o.current!=current;
}
