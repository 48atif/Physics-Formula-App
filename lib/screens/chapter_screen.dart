import 'package:flutter/material.dart';
import '../data/physics_data.dart';
import '../models/physics_models.dart';
import 'law_detail_screen.dart';

class ChapterScreen extends StatelessWidget {
  final String? initialCategory;
  const ChapterScreen({super.key,this.initialCategory});
  @override Widget build(BuildContext c){
    final selected=initialCategory;
    final list=selected==null?chapters:chapters.where((x)=>x.category==selected).toList();
    return Scaffold(appBar:AppBar(title:Text(selected ?? 'Explore Physics')),body:ListView.separated(
      padding:const EdgeInsets.all(18),itemCount:list.length,separatorBuilder:(_,__)=>const SizedBox(height:10),
      itemBuilder:(context,i)=>_ChapterTile(chapter:list[i]),
    ));
  }
}
class _ChapterTile extends StatelessWidget{
 final PhysicsChapter chapter;const _ChapterTile({required this.chapter});
 @override Widget build(BuildContext c)=>Card(child:ExpansionTile(
  leading:Text(chapter.icon,style:const TextStyle(fontSize:28)),
  title:Text(chapter.title,style:const TextStyle(fontWeight:FontWeight.w800)),
  subtitle:Text(chapter.category),
  childrenPadding:const EdgeInsets.fromLTRB(18,0,18,18),
  children:[
   Text(chapter.introduction),
   const SizedBox(height:12),
   if(chapter.laws.isNotEmpty)...[
    Align(alignment:Alignment.centerLeft,child:Text('Laws & Principles',style:Theme.of(c).textTheme.titleMedium?.copyWith(fontWeight:FontWeight.bold))),
    const SizedBox(height:6),
    ...chapter.laws.map((law)=>ListTile(contentPadding:EdgeInsets.zero,title:Text(law.title),subtitle:Text(law.formula),trailing:const Icon(Icons.science_outlined),onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>LawDetailScreen(law:law))))),
   ],
   if(chapter.formulas.isNotEmpty)...[
    Align(alignment:Alignment.centerLeft,child:Text('Important formulas',style:Theme.of(c).textTheme.titleMedium?.copyWith(fontWeight:FontWeight.bold))),
    ...chapter.formulas.map((f)=>ListTile(contentPadding:EdgeInsets.zero,title:Text(f.formula,style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text(f.meaning))),
   ],
   if(chapter.experiments.isNotEmpty)...[
    const Divider(), Align(alignment:Alignment.centerLeft,child:Text('Experiments',style:Theme.of(c).textTheme.titleMedium?.copyWith(fontWeight:FontWeight.bold))),
    ...chapter.experiments.map((e)=>ListTile(contentPadding:EdgeInsets.zero,title:Text(e.title),subtitle:Text(e.objective),onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>LawDetailScreen(experiment:e))))),
   ],
  ],
 ));
}
