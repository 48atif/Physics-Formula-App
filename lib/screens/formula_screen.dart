import 'package:flutter/material.dart';
import '../data/physics_data.dart';

class FormulaScreen extends StatefulWidget {
  const FormulaScreen({super.key});
  @override State<FormulaScreen> createState()=>_FormulaScreenState();
}
class _FormulaScreenState extends State<FormulaScreen>{
 String q='';
 @override Widget build(BuildContext c){
  final all=chapters.expand((x)=>x.formulas).where((f)=>('${f.formula} ${f.meaning} ${f.chapter}').toLowerCase().contains(q.toLowerCase())).toList();
  return Scaffold(appBar:AppBar(title:const Text('Formula Library')),body:ListView(padding:const EdgeInsets.all(18),children:[
   TextField(decoration:const InputDecoration(prefixIcon:Icon(Icons.search),hintText:'Search formula, chapter or meaning'),onChanged:(v)=>setState(()=>q=v)),
   const SizedBox(height:14),
   ...all.map((f)=>Card(child:ListTile(title:Text(f.formula,style:const TextStyle(fontWeight:FontWeight.w900,fontSize:18)),subtitle:Text('${f.meaning}\n${f.variables}\n${f.units}'),isThreeLine:true,trailing:const Icon(Icons.functions)))),
  ]));
 }
}
