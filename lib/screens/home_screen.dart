import 'package:flutter/material.dart';
import 'package:physix_lab/models/physics_models.dart';
import '../data/physics_data.dart';
import '../widgets/category_card.dart';
import 'chapter_screen.dart';
import 'formula_screen.dart';
import 'experiment_screen.dart';
import 'quiz_screen.dart';
import 'progress_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState()=>_HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
 int index=0;
 final screens = const [HomeTab(), FormulaScreen(), ExperimentScreen(), QuizScreen(), ProgressScreen()];
 @override Widget build(BuildContext context)=>Scaffold(
  body: screens[index],
  bottomNavigationBar: NavigationBar(selectedIndex:index,onDestinationSelected:(v)=>setState(()=>index=v),destinations:const[
   NavigationDestination(icon:Icon(Icons.home_outlined),selectedIcon:Icon(Icons.home),label:'Home'),
   NavigationDestination(icon:Icon(Icons.functions),label:'Formulas'),
   NavigationDestination(icon:Icon(Icons.science_outlined),label:'Experiments'),
   NavigationDestination(icon:Icon(Icons.quiz_outlined),label:'Quiz'),
   NavigationDestination(icon:Icon(Icons.insights_outlined),label:'Progress'),
  ]),
 );
}
class HomeTab extends StatelessWidget{
 const HomeTab({super.key});
 @override Widget build(BuildContext c){
  final groups=<String,List<PhysicsChapter>>{};
  for(final ch in chapters){groups.putIfAbsent(ch.category,()=>[]).add(ch);}
  return SafeArea(child:CustomScrollView(slivers:[
   SliverPadding(padding:const EdgeInsets.fromLTRB(20,22,20,0),sliver:SliverToBoxAdapter(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Text('PhysiX Lab',style:Theme.of(c).textTheme.headlineMedium?.copyWith(fontWeight:FontWeight.w900)),
    Text('Interactive Physics Laboratory',style:Theme.of(c).textTheme.titleMedium),
    const SizedBox(height:18),
    Card(color:Theme.of(c).colorScheme.primaryContainer,child:Padding(padding:const EdgeInsets.all(22),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Text("Don't just memorize Physics.",style:Theme.of(c).textTheme.headlineSmall?.copyWith(fontWeight:FontWeight.w800)),
      Text('Experiment with it.',style:Theme.of(c).textTheme.headlineSmall),
      const SizedBox(height:12),
      Text('Learn Physics by seeing it, controlling it and experimenting with it.'),
      const SizedBox(height:16),
      FilledButton.icon(onPressed:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>const ChapterScreen())),icon:const Icon(Icons.play_arrow),label:const Text('Explore Simulations')),
    ]))),
    const SizedBox(height:22),
    Text('Explore Physics',style:Theme.of(c).textTheme.titleLarge?.copyWith(fontWeight:FontWeight.w800)),
    const SizedBox(height:10),
   ]))),
   SliverPadding(padding:const EdgeInsets.symmetric(horizontal:20),sliver:SliverList(delegate:SliverChildBuilderDelegate((context,i){
    final key=groups.keys.elementAt(i); final list=groups[key]!;
    return Padding(padding:const EdgeInsets.only(bottom:10),child:CategoryCard(title:key,icon:list.first.icon,onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>ChapterScreen(initialCategory:key)))));
   },childCount:groups.length))),
   SliverPadding(padding:const EdgeInsets.fromLTRB(20,10,20,30),sliver:SliverToBoxAdapter(child:Card(child:ListTile(leading:const Icon(Icons.flag_rounded),title:const Text('Daily Physics Challenge'),subtitle:const Text('Open Quiz and test one concept today.'),trailing:const Icon(Icons.arrow_forward_ios_rounded),onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>const QuizScreen())))))),
  ]));
 }
}
