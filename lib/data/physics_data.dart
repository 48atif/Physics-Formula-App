import '../models/physics_models.dart';

const chapters = <PhysicsChapter>[
  PhysicsChapter(
    id: 'measurement',
    title: 'Physical Quantities & Measurement',
    category: 'Mechanics',
    icon: '⚙',
    introduction: 'Measurement gives a physical quantity a numerical value and a unit. Explore instruments, units, conversion and measurement ideas.',
    formulas: [
      PhysicsFormula(id: 'm1', formula: 'Q = numerical value × unit', meaning: 'A measured physical quantity is expressed using a number and a unit.', variables: 'Q = quantity', units: 'Depends on quantity', chapter: 'Measurement'),
    ],
    experiments: [
      PhysicsExperiment(id: 'e1', title: 'Virtual Ruler', objective: 'Measure the length of an object.', procedure: 'Drag the object against the ruler and read the scale.', observation: 'The reading changes with object length.', result: 'Record the measured value with its unit.', simulationType: 'measurement'),
    ],
  ),
  PhysicsChapter(
    id: 'motion',
    title: 'Motion',
    category: 'Mechanics',
    icon: '↗',
    introduction: 'Study distance, displacement, speed, velocity, acceleration, graphs and motion equations through interactive models.',
    formulas: [
      PhysicsFormula(id: 'mo1', formula: 'v = s / t', meaning: 'Average speed is distance divided by time.', variables: 'v = speed, s = distance, t = time', units: 'm/s', chapter: 'Motion'),
      PhysicsFormula(id: 'mo2', formula: 's = ut + ½at²', meaning: 'Displacement relation for uniformly accelerated motion.', variables: 's = displacement, u = initial velocity, a = acceleration, t = time', units: 'SI units', chapter: 'Motion'),
    ],
    experiments: [
      PhysicsExperiment(id: 'moe', title: 'Free Fall Lab', objective: 'Observe position, velocity and acceleration during vertical motion.', procedure: 'Set height, initial velocity and gravity, then run the simulation.', observation: 'The velocity changes with time according to the selected acceleration.', result: 'Compare measured values with the motion equation.', simulationType: 'freeFall'),
    ],
  ),
  PhysicsChapter(
    id: 'force',
    title: 'Force',
    category: 'Mechanics',
    icon: '→',
    introduction: 'Explore force, inertia, acceleration, action-reaction and momentum with vector-based simulations.',
    laws: [
      PhysicsLaw(id: 'n1', title: "Newton's First Law", statement: 'An object maintains its state of motion unless an external force changes that state.', explanation: 'The simulation lets you change applied force and friction and observe the motion response.', formula: 'ΣF = 0 → constant velocity', variables: 'Force, velocity, friction', units: 'N, m/s', simulationType: 'newton1', example: 'A moving cart continues moving when the net external force is zero in the idealized model.', commonMistake: 'Confusing zero net force with zero velocity.', examNote: 'State the role of net external force clearly.',
    ),
      PhysicsLaw(id: 'n2', title: "Newton's Second Law", statement: 'The net force on an object is related to its mass and acceleration.', explanation: 'Change force or mass and the cart acceleration is recalculated immediately.', formula: 'F = ma', variables: 'F = force, m = mass, a = acceleration', units: 'N, kg, m/s²', simulationType: 'newton2', example: 'For F = 20 N and m = 5 kg, a = 4 m/s².', commonMistake: 'Changing force or mass without recalculating acceleration.', examNote: 'Keep units consistent before calculating.',
    ),
      PhysicsLaw(id: 'n3', title: "Newton's Third Law", statement: 'Interacting objects exert forces on each other in opposite directions.', explanation: 'Two carts display equal-magnitude opposite-direction interaction arrows.', formula: 'F₁₂ = −F₂₁', variables: 'Interaction force pair', units: 'N', simulationType: 'newton3', example: 'When two carts push, each experiences an opposite-direction interaction force.', commonMistake: 'Treating action and reaction as forces on the same object.', examNote: 'Identify the two interacting objects.',
    ),
      PhysicsLaw(id: 'pm', title: 'Momentum', statement: 'Momentum depends on mass and velocity.', explanation: 'Change either mass or velocity to see the momentum vector update.', formula: 'p = mv', variables: 'p = momentum, m = mass, v = velocity', units: 'kg·m/s', simulationType: 'momentum', example: 'Doubling velocity doubles momentum when mass is fixed.', commonMistake: 'Ignoring the direction of velocity in vector problems.', examNote: 'Include direction where required.',
    )],
    formulas: [
      PhysicsFormula(id: 'f1', formula: 'F = ma', meaning: 'Force equals mass multiplied by acceleration.', variables: 'F, m, a', units: 'N = kg·m/s²', chapter: 'Force'),
      PhysicsFormula(id: 'f2', formula: 'p = mv', meaning: 'Momentum equals mass multiplied by velocity.', variables: 'p, m, v', units: 'kg·m/s', chapter: 'Force'),
    ],
  ),
  PhysicsChapter(
    id: 'work',
    title: 'Work, Power & Energy',
    category: 'Mechanics',
    icon: '⚡',
    introduction: 'Explore work, power, kinetic energy, potential energy and energy transformation.',
    formulas: [
      PhysicsFormula(id: 'w1', formula: 'P = W / t', meaning: 'Power is work done per unit time.', variables: 'P = power, W = work, t = time', units: 'W', chapter: 'Work, Power & Energy'),
      PhysicsFormula(id: 'w2', formula: 'Eₖ = ½mv²', meaning: 'Kinetic energy relation.', variables: 'm = mass, v = speed', units: 'J', chapter: 'Work, Power & Energy'),
    ],
    experiments: [
      PhysicsExperiment(id: 'we', title: 'Ramp Energy Lab', objective: 'Observe potential-to-kinetic energy transformation.', procedure: 'Change ramp height and run the ball.', observation: 'Potential energy decreases as kinetic energy increases in the idealized model.', result: 'Compare energy values before and during motion.', simulationType: 'energy'),
    ],
  ),
  PhysicsChapter(id: 'pressure', title: 'States of Matter & Pressure', category: 'Matter & Heat', icon: '🌡', introduction: 'Explore states of matter and pressure using visual particle and fluid models.', formulas: [
    PhysicsFormula(id: 'p1', formula: 'p = F / A', meaning: 'Pressure is force per unit area.', variables: 'p = pressure, F = force, A = area', units: 'Pa', chapter: 'Pressure'),
  ]),
  PhysicsChapter(id: 'heat', title: 'Effects of Heat on Matter', category: 'Matter & Heat', icon: '🔥', introduction: 'Explore temperature change, thermal motion and changes of state using particle visualization.'),
  PhysicsChapter(id: 'waves', title: 'Waves & Sound', category: 'Waves & Sound', icon: '〰', introduction: 'Control amplitude, frequency and wavelength and observe a mathematically driven wave.', formulas: [
    PhysicsFormula(id: 'wa1', formula: 'v = fλ', meaning: 'Wave speed is frequency multiplied by wavelength.', variables: 'v = speed, f = frequency, λ = wavelength', units: 'm/s, Hz, m', chapter: 'Waves & Sound'),
  ], experiments: [
    PhysicsExperiment(id: 'wae', title: 'Wave Lab', objective: 'Investigate the relationship between frequency, wavelength and wave speed.', procedure: 'Adjust frequency and wavelength and observe the live wave.', observation: 'The displayed speed follows v = fλ.', result: 'Record combinations of f, λ and v.', simulationType: 'wave'),
  ]),
  PhysicsChapter(id: 'reflection', title: 'Reflection of Light', category: 'Optics', icon: '↩', introduction: 'Explore incident rays, normals and reflected rays with adjustable angles.', formulas: [
    PhysicsFormula(id: 'r1', formula: 'i = r', meaning: 'Angle of incidence equals angle of reflection in the standard reflection model.', variables: 'i = incidence angle, r = reflection angle', units: 'degrees', chapter: 'Reflection of Light'),
  ]),
  PhysicsChapter(id: 'refraction', title: 'Refraction of Light', category: 'Optics', icon: '🔦', introduction: 'Observe a light ray bending when it enters a different medium.', formulas: [
    PhysicsFormula(id: 'rf1', formula: 'n₁ sin θ₁ = n₂ sin θ₂', meaning: 'A standard refractive-index relationship for two media.', variables: 'n = refractive index, θ = angle', units: 'dimensionless, degrees', chapter: 'Refraction of Light'),
  ]),
  PhysicsChapter(id: 'static', title: 'Static Electricity', category: 'Electricity', icon: '+−', introduction: 'Explore charge, attraction, repulsion and electric-field concepts visually.'),
  PhysicsChapter(id: 'current', title: 'Current Electricity', category: 'Electricity', icon: '🔌', introduction: 'Explore circuits, resistance and current with an interactive Ohm’s Law laboratory.', formulas: [
    PhysicsFormula(id: 'c1', formula: 'V = IR', meaning: 'Voltage equals current multiplied by resistance.', variables: 'V = voltage, I = current, R = resistance', units: 'V, A, Ω', chapter: 'Current Electricity'),
  ]),
  PhysicsChapter(id: 'electromagnetic', title: 'Electromagnetic Effects of Electricity', category: 'Electricity', icon: '🧲', introduction: 'Visualize magnetic fields around current-carrying conductors and introductory induction concepts.'),
  PhysicsChapter(id: 'modern', title: 'Radioactivity & Electronics', category: 'Modern Physics', icon: '☢', introduction: 'Explore conceptual models of radioactivity and textbook-supported electronic components.'),
];

const quizQuestions = <QuizQuestion>[
  QuizQuestion(
    question: 'If force stays constant and mass is doubled, what happens to acceleration in F = ma?',
    options: ['It doubles', 'It becomes half', 'It stays the same', 'It becomes zero'],
    answer: 1,
    explanation: 'Since a = F/m, increasing mass while keeping force constant reduces acceleration.',
  ),
  QuizQuestion(
    question: 'Which quantity is measured in kg·m/s?',
    options: ['Force', 'Power', 'Momentum', 'Pressure'],
    answer: 2,
    explanation: 'Momentum p = mv, so its SI unit is kg·m/s.',
  ),
  QuizQuestion(
    question: 'In the wave relation v = fλ, λ represents:',
    options: ['Force', 'Wavelength', 'Power', 'Pressure'],
    answer: 1,
    explanation: 'λ is wavelength.',
  ),
];
