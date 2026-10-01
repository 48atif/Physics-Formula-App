import 'package:flutter/material.dart';
import '../data/physics_data.dart';
import 'law_detail_screen.dart';

class ExperimentScreen extends StatelessWidget{
 const ExperimentScreen({super.key});
 @override Widget build(BuildContext c){
  final items=chapters.expand((x)=>x.experiments).toList();
  return Scaffold(appBar:AppBar(title:const Text('Virtual Experiments')),body:ListView.separated(padding:const EdgeInsets.all(18),itemCount:items.length,separatorBuilder:(_,__)=>const SizedBox(height:10),itemBuilder:(context,i){
   final e=items[i]; return Card(child:ListTile(leading:const CircleAvatar(child:Icon(Icons.science_outlined)),title:Text(e.title,style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(e.objective),trailing:const Icon(Icons.arrow_forward_ios_rounded),onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>LawDetailScreen(experiment:e)))));
  }));
 }
}
