import 'package:flutter/material.dart';
import '../models/physics_models.dart';
import '../simulations/free_fall_simulation.dart';
import '../simulations/newton_simulation.dart';
import '../simulations/wave_simulation.dart';
import '../simulations/ohm_simulation.dart';
import '../simulations/refraction_simulation.dart';

class LawDetailScreen extends StatelessWidget {
  final PhysicsLaw? law;
  final PhysicsExperiment? experiment;
  const LawDetailScreen({super.key,this.law,this.experiment});
  @override Widget build(BuildContext c){
    final title=law?.title ?? experiment!.title;
    final type=law?.simulationType ?? experiment!.simulationType;
    return Scaffold(appBar:AppBar(title:Text(title)),body:ListView(padding:const EdgeInsets.all(18),children:[
      Text(title,style:Theme.of(c).textTheme.headlineSmall?.copyWith(fontWeight:FontWeight.w900)),
      const SizedBox(height:12),
      if(law!=null)...[
       _Info('Simple explanation',law!.explanation),
       _Info('Formula',law!.formula),
       _Info('Variables',law!.variables),
       _Info('SI units',law!.units),
       _Info('Real-world example',law!.example),
       _Info('Common mistake',law!.commonMistake),
       _Info('Exam note',law!.examNote),
      ] else ...[
       _Info('Objective',experiment!.objective),
       _Info('Procedure',experiment!.procedure),
       _Info('Observation',experiment!.observation),
       _Info('Result',experiment!.result),
      ],
      const SizedBox(height:8),
      Card(child:Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
       Text('Interactive Simulation',style:Theme.of(c).textTheme.titleLarge?.copyWith(fontWeight:FontWeight.w800)),
       const SizedBox(height:16),
       _simulation(type),
      ]))),
    ]));
  }
  Widget _simulation(String type){
    switch(type){
      case 'freeFall': return const FreeFallSimulation();
      case 'newton1':
      case 'newton2':
      case 'newton3':
      case 'momentum': return const NewtonSimulation();
      case 'wave': return const WaveSimulation();
      case 'refraction': return const RefractionSimulation();
      case 'ohm': return const OhmSimulation();
      case 'measurement': return const _PlaceholderSimulation(title:'Virtual Ruler',message:'Drag-and-measure interface can be added here using a CustomPainter and gesture handling.');
      case 'energy': return const _PlaceholderSimulation(title:'Energy Ramp',message:'The architecture is ready for a ramp painter driven by potential and kinetic energy equations.');
      default: return const _PlaceholderSimulation(title:'Visual Explanation',message:'This topic is currently represented as an interactive learning section. Add textbook-supported simulation details here.');
    }
  }
}
class _Info extends StatelessWidget{final String title,text;const _Info(this.title,this.text);@override Widget build(BuildContext c)=>Padding(padding:const EdgeInsets.only(bottom:14),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(title,style:Theme.of(c).textTheme.labelLarge?.copyWith(fontWeight:FontWeight.bold)),const SizedBox(height:4),Text(text)]));}
class _PlaceholderSimulation extends StatelessWidget{final String title,message;const _PlaceholderSimulation({required this.title,required this.message});@override Widget build(BuildContext c)=>Container(padding:const EdgeInsets.all(22),decoration:BoxDecoration(borderRadius:BorderRadius.circular(18),color:Theme.of(c).colorScheme.surfaceContainerHighest),child:Column(children:[const Icon(Icons.science_outlined,size:50),const SizedBox(height:10),Text(title,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:18)),const SizedBox(height:6),Text(message,textAlign:TextAlign.center)]));}
