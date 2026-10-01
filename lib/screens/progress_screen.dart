import 'package:flutter/material.dart';
import '../data/physics_data.dart';

class ProgressScreen extends StatelessWidget{
 const ProgressScreen({super.key});
 @override Widget build(BuildContext c){
  final categories=<String,int>{};
  for(final x in chapters) categories[x.category]=(categories[x.category]??0)+1;
  return Scaffold(appBar:AppBar(title:const Text('Your Progress')),body:ListView(padding:const EdgeInsets.all(18),children:[
   Card(child:Padding(padding:const EdgeInsets.all(20),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Text('Learning overview',style:Theme.of(c).textTheme.titleLarge?.copyWith(fontWeight:FontWeight.w800)),
    const SizedBox(height:8),Text('${chapters.length} chapters available'),const SizedBox(height:14),
    const LinearProgressIndicator(value:.12),const SizedBox(height:8),const Text('12% starter progress'),
   ]))),
   const SizedBox(height:14),
   ...categories.entries.map((e)=>Card(child:ListTile(title:Text(e.key),subtitle:Text('${e.value} chapter(s)'),trailing:SizedBox(width:90,child:LinearProgressIndicator(value:.1))))),
  ]));
 }
}
