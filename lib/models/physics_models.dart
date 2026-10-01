class PhysicsChapter {
  final String id;
  final String title;
  final String category;
  final String icon;
  final String introduction;
  final List<PhysicsLaw> laws;
  final List<PhysicsFormula> formulas;
  final List<PhysicsExperiment> experiments;

  const PhysicsChapter({
    required this.id,
    required this.title,
    required this.category,
    required this.icon,
    required this.introduction,
    this.laws = const [],
    this.formulas = const [],
    this.experiments = const [],
  });
}

class PhysicsLaw {
  final String id;
  final String title;
  final String statement;
  final String explanation;
  final String formula;
  final String variables;
  final String units;
  final String simulationType;
  final String example;
  final String commonMistake;
  final String examNote;

  const PhysicsLaw({
    required this.id,
    required this.title,
    required this.statement,
    required this.explanation,
    required this.formula,
    required this.variables,
    required this.units,
    required this.simulationType,
    required this.example,
    required this.commonMistake,
    required this.examNote,
  });
}

class PhysicsFormula {
  final String id;
  final String formula;
  final String meaning;
  final String variables;
  final String units;
  final String chapter;

  const PhysicsFormula({
    required this.id,
    required this.formula,
    required this.meaning,
    required this.variables,
    required this.units,
    required this.chapter,
  });
}

class PhysicsExperiment {
  final String id;
  final String title;
  final String objective;
  final String procedure;
  final String observation;
  final String result;
  final String simulationType;

  const PhysicsExperiment({
    required this.id,
    required this.title,
    required this.objective,
    required this.procedure,
    required this.observation,
    required this.result,
    required this.simulationType,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.answer,
    required this.explanation,
  });
}
