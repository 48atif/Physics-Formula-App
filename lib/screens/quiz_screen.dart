import 'package:flutter/material.dart';
import '../data/physics_data.dart';

class QuizScreen extends StatefulWidget{
 const QuizScreen({super.key});
 @override State<QuizScreen> createState()=>_QuizScreenState();
}
class _QuizScreenState extends State<QuizScreen>{
 int i=0,score=0; int? selected; bool answered=false;
 void choose(int x){if(answered)return;setState((){selected=x;answered=true;if(x==quizQuestions[i].answer)score++;});}
 void next(){if(i==quizQuestions.length-1){showDialog(context:context,builder:(_)=>AlertDialog(title:const Text('Quiz complete'),content:Text('Score: $score/${quizQuestions.length}'),actions:[TextButton(onPressed:(){Navigator.pop(context);setState((){i=0;score=0;selected=null;answered=false;});},child:const Text('Restart'))]));return;}setState((){i++;selected=null;answered=false;});}
  @override
  Widget build(BuildContext c) {
    final q = quizQuestions[i];

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          LinearProgressIndicator(value: (i + 1) / quizQuestions.length),
          const SizedBox(height: 20),
          Text(
            'Question ${i + 1} of ${quizQuestions.length}',
            style: Theme.of(c).textTheme.labelLarge,
          ),
          const SizedBox(height: 8),
          Text(
            q.question,
            style: Theme.of(c).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            q.options.length,
            (x) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Card(
                color: answered && x == q.answer
                    ? Colors.green.withOpacity(.15)
                    : answered && x == selected
                        ? Colors.red.withOpacity(.12)
                        : null,
                child: ListTile(
                  onTap: () => choose(x),
                  title: Text(q.options[x]),
                  trailing:
                      answered && x == q.answer ? const Icon(Icons.check) : null,
                ),
              ),
            ),
          ),
          if (answered)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(q.explanation),
              ),
            ),
          if (answered)
            FilledButton(
              onPressed: next,
              child: Text(i == quizQuestions.length - 1 ? 'Finish' : 'Next'),
            ),
        ],
      ),
    );
  }
}
