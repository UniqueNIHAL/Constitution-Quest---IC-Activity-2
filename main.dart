import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  // Reset global score each time the app launches
  GlobalScore.reset();
  runApp(const ConstitutionQuestApp());
}

/// A simple global store for the total score across all levels.
class GlobalScore {
  static int total = 0;
  static void reset() => total = 0;
}

/// Colors used throughout the app
const saffron = Color(0xFFFF9933);
const green = Color(0xFF138808);
const white = Colors.white;

/// A reusable gradient background
BoxDecoration customGradient() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [saffron, white],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}

class ConstitutionQuestApp extends StatelessWidget {
  const ConstitutionQuestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Constitution Quest',
      theme: ThemeData(
        primaryColor: saffron,
        appBarTheme: const AppBarTheme(
          backgroundColor: saffron,
          foregroundColor: white,
        ),
        scaffoldBackgroundColor: white,
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}

// -----------------------------------------------------
// 1. WELCOME SCREEN
// -----------------------------------------------------
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Optionally reset score every time we return here:
    // GlobalScore.reset();

    return Scaffold(
      appBar: AppBar(title: const Text('Constitution Quest')),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: customGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Constitution Quest!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'A fun and interactive way to learn the basics of the Indian Constitution.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                foregroundColor: white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DescriptionScreen()),
                );
              },
              child: const Text('Let\'s Begin'),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------
// 2. DESCRIPTION SCREEN
// -----------------------------------------------------
class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About This Game')),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: customGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Learn the Indian Constitution',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'We’ve split each level into multiple pages to keep it fun!\n'
              '• Level 1: Preamble Puzzle (3 sub-levels)\n'
              '• Level 2: Articles Matching (3 sub-levels)\n'
              '• Level 3: Scenario Quiz (10 questions)\n\n'
              'Scoring in Levels 1 & 2:\n'
              '- Solve puzzle without pressing Retry or failing = 5 points\n'
              '- If you press Retry or fail at least once, you earn 3 points\n'
              'All scores reset each time you relaunch the app!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                foregroundColor: white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LevelSelectScreen()),
                );
              },
              child: const Text('Choose a Level'),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------
// 3. LEVEL SELECT SCREEN
//    Shows the current global score at the top
// -----------------------------------------------------
class LevelSelectScreen extends StatefulWidget {
  const LevelSelectScreen({Key? key}) : super(key: key);

  @override
  State<LevelSelectScreen> createState() => _LevelSelectScreenState();
}

class _LevelSelectScreenState extends State<LevelSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Level'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: customGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Score: ${GlobalScore.total}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Pick a Level to Start',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: saffron,
                foregroundColor: white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LevelOneMain()),
                ).then((_) => setState(() {})); 
                // Refresh after returning
              },
              child: const Text('Level 1: Preamble Puzzle'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: saffron,
                foregroundColor: white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LevelTwoMain()),
                ).then((_) => setState(() {}));
              },
              child: const Text('Level 2: Articles Matching'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: saffron,
                foregroundColor: white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LevelThreeQuiz()),
                ).then((_) => setState(() {}));
              },
              child: const Text('Level 3: Scenario Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------
// 4. LEVEL ONE MAIN (3 Sub-levels of the Preamble Puzzle)
//    Each sub-level has Check/Retry/Next buttons + Points
// -----------------------------------------------------
class LevelOneMain extends StatefulWidget {
  const LevelOneMain({Key? key}) : super(key: key);

  @override
  State<LevelOneMain> createState() => _LevelOneMainState();
}

class _LevelOneMainState extends State<LevelOneMain> {
  // We'll split the full Preamble lines into 3 sub-levels
  final List<List<String>> sublevels = [
    [
      "WE, THE PEOPLE OF INDIA,",
      "having solemnly resolved to constitute India into a",
      "SOVEREIGN SOCIALIST SECULAR DEMOCRATIC REPUBLIC",
    ],
    [
      "and to secure to all its citizens:",
      "JUSTICE, social, economic and political;",
      "LIBERTY of thought, expression, belief, faith and worship;",
    ],
    [
      "EQUALITY of status and of opportunity;",
      "and to promote among them all FRATERNITY",
      "assuring the dignity of the individual and the unity and integrity of the Nation;",
      "IN OUR CONSTITUENT ASSEMBLY this twenty-sixth day of November, 1949, do HEREBY ADOPT, ENACT AND GIVE TO OURSELVES THIS CONSTITUTION."
    ],
  ];

  final List<List<String>> correctOrders = [
    [
      "WE, THE PEOPLE OF INDIA,",
      "having solemnly resolved to constitute India into a",
      "SOVEREIGN SOCIALIST SECULAR DEMOCRATIC REPUBLIC",
    ],
    [
      "and to secure to all its citizens:",
      "JUSTICE, social, economic and political;",
      "LIBERTY of thought, expression, belief, faith and worship;",
    ],
    [
      "EQUALITY of status and of opportunity;",
      "and to promote among them all FRATERNITY",
      "assuring the dignity of the individual and the unity and integrity of the Nation;",
      "IN OUR CONSTITUENT ASSEMBLY this twenty-sixth day of November, 1949, do HEREBY ADOPT, ENACT AND GIVE TO OURSELVES THIS CONSTITUTION."
    ],
  ];

  int currentSublevel = 0;
  int totalScore = 0; // Accumulate points across sub-levels

  @override
  Widget build(BuildContext context) {
    // Use a ValueKey to force re-initialization of sub-level widget
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 1: Sub-level ${currentSublevel + 1}'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: customGradient(),
        child: SingleChildScrollView(
          child: PreamblePuzzleSublevel(
            key: ValueKey(currentSublevel), // Force rebuild on sub-level change
            lines: sublevels[currentSublevel],
            correctOrder: correctOrders[currentSublevel],
            onPuzzleComplete: _handleSublevelComplete,
          ),
        ),
      ),
    );
  }

  void _handleSublevelComplete(int pointsEarned) {
    // Add sub-level points to total
    totalScore += pointsEarned;

    // Move to next sub-level or finish
    if (currentSublevel < sublevels.length - 1) {
      setState(() {
        currentSublevel++;
      });
    } else {
      // All sub-levels done => add to GlobalScore
      GlobalScore.total += totalScore;

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Congratulations!'),
          content: Text(
            'You completed all sub-levels of Level 1!\n'
            'Level 1 Score: $totalScore\n'
            'Global Score: ${GlobalScore.total}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
                Navigator.pop(context); // go back to Level Select
              },
              child: const Text('Back to Levels'),
            ),
          ],
        ),
      );
    }
  }
}

/// A widget for one sub-level puzzle
/// If user never fails or presses Retry => 5 points, else => 3
class PreamblePuzzleSublevel extends StatefulWidget {
  final List<String> lines;
  final List<String> correctOrder;
  final Function(int) onPuzzleComplete; // Pass points up

  const PreamblePuzzleSublevel({
    Key? key,
    required this.lines,
    required this.correctOrder,
    required this.onPuzzleComplete,
  }) : super(key: key);

  @override
  State<PreamblePuzzleSublevel> createState() => _PreamblePuzzleSublevelState();
}

class _PreamblePuzzleSublevelState extends State<PreamblePuzzleSublevel> {
  late List<String> draggableItems;
  late List<String?> slots;
  bool isSolved = false;
  String feedbackMessage = "";
  bool usedRetryOrFailed = false; // If user pressed Retry or got it wrong
  int puzzlePoints = 0;
  bool didPressNext = false; // Guard for multiple Next presses

  @override
  void initState() {
    super.initState();
    resetPuzzle();
  }

  void resetPuzzle() {
    // Do not reset usedRetryOrFailed to false - we keep it if we already failed
    setState(() {
      isSolved = false;
      feedbackMessage = "";
      puzzlePoints = 0;
      didPressNext = false;
      draggableItems = List.from(widget.lines);
      draggableItems.shuffle();
      slots = List.filled(widget.lines.length, null);
    });
  }

  void checkSolution() {
    bool correct = true;
    for (int i = 0; i < widget.correctOrder.length; i++) {
      if (slots[i] != widget.correctOrder[i]) {
        correct = false;
        break;
      }
    }

    if (correct) {
      setState(() {
        isSolved = true;
        puzzlePoints = usedRetryOrFailed ? 3 : 5;
        feedbackMessage =
            "Puzzle solved! You earned $puzzlePoints points.\nPress Next →";
      });
    } else {
      setState(() {
        usedRetryOrFailed = true; // They got it wrong
        feedbackMessage = "Wrong arrangement! Adjust or Retry.";
      });
    }
  }

  void onRetry() {
    usedRetryOrFailed = true;
    resetPuzzle();
  }

  void onNext() {
    // Guard if user double-clicks Next
    if (didPressNext) return;
    didPressNext = true;

    if (isSolved) {
      // Pass points up to the parent
      widget.onPuzzleComplete(puzzlePoints);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Arrange these lines in the correct order:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        // Drop Targets
        Column(
          children: List.generate(widget.correctOrder.length, (index) {
            return DragTarget<String>(
              onAccept: (data) {
                setState(() {
                  slots[index] = data;
                  draggableItems.remove(data);
                });
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: double.infinity,
                  height: 60,
                  margin: const EdgeInsets.symmetric(vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      slots[index] ?? 'Drop Here',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            );
          }),
        ),
        const SizedBox(height: 20),
        // Draggable Items
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: draggableItems.map((item) {
            return Draggable<String>(
              data: item,
              feedback: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              childWhenDragging: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        if (feedbackMessage.isNotEmpty)
          Text(
            feedbackMessage,
            style: const TextStyle(color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: 12),
        // Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isSolved ? null : checkSolution,
              style: ElevatedButton.styleFrom(
                backgroundColor: saffron,
                foregroundColor: white,
              ),
              child: const Text("Check"),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: isSolved ? null : onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: white,
              ),
              child: const Text("Retry"),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: isSolved ? onNext : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                foregroundColor: white,
              ),
              child: const Text("Next"),
            ),
          ],
        ),
      ],
    );
  }
}

// -----------------------------------------------------
// 5. LEVEL TWO MAIN (3 Sub-levels of Articles Matching)
//    Each sub-level also has Check/Retry/Next + Points
// -----------------------------------------------------
class LevelTwoMain extends StatefulWidget {
  const LevelTwoMain({Key? key}) : super(key: key);

  @override
  State<LevelTwoMain> createState() => _LevelTwoMainState();
}

class _LevelTwoMainState extends State<LevelTwoMain> {
  // We'll split the 10 Articles into 3 sub-levels
  final List<Map<String, String>> sublevelData = [
    {
      "Article 14": "Equality Before Law",
      "Article 15": "Prohibition of Discrimination",
      "Article 16": "Equality of Opportunity in Public Employment",
    },
    {
      "Article 19": "Freedoms (Speech, Expression, etc.)",
      "Article 21": "Right to Life and Personal Liberty",
      "Article 21A": "Right to Education",
    },
    {
      "Article 23": "Prohibition of Trafficking/Forced Labor",
      "Article 24": "Prohibition of Child Labor",
      "Article 25": "Freedom of Religion",
      "Article 29": "Protection of Interests of Minorities",
    },
  ];

  int currentSublevel = 0;
  int totalScore = 0; // Accumulate points across sub-levels

  @override
  Widget build(BuildContext context) {
    final data = sublevelData[currentSublevel];
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 2: Sub-level ${currentSublevel + 1}'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: customGradient(),
        child: SingleChildScrollView(
          child: MatchingPuzzleSublevel(
            key: ValueKey(currentSublevel), // Force new sub-level widget
            articlesMap: data,
            onPuzzleComplete: _handleSublevelComplete,
          ),
        ),
      ),
    );
  }

  void _handleSublevelComplete(int pointsEarned) {
    totalScore += pointsEarned;

    if (currentSublevel < sublevelData.length - 1) {
      setState(() {
        currentSublevel++;
      });
    } else {
      // All sub-levels done => add to GlobalScore
      GlobalScore.total += totalScore;

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Excellent!'),
          content: Text(
            'You completed all sub-levels of Level 2!\n'
            'Level 2 Score: $totalScore\n'
            'Global Score: ${GlobalScore.total}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
                Navigator.pop(context); // go back to Level Select
              },
              child: const Text('Back to Levels'),
            ),
          ],
        ),
      );
    }
  }
}

/// A widget for one sub-level of matching puzzle
/// If user never fails or presses Retry => 5 points, else => 3
class MatchingPuzzleSublevel extends StatefulWidget {
  final Map<String, String> articlesMap;
  final Function(int) onPuzzleComplete; // pass points up

  const MatchingPuzzleSublevel({
    Key? key,
    required this.articlesMap,
    required this.onPuzzleComplete,
  }) : super(key: key);

  @override
  State<MatchingPuzzleSublevel> createState() =>
      _MatchingPuzzleSublevelState();
}

class _MatchingPuzzleSublevelState extends State<MatchingPuzzleSublevel> {
  late List<String> articles; // keys
  late List<String> descriptions; // values
  late Map<String, String?> userMatches;
  bool isSolved = false;
  String feedbackMessage = "";
  bool usedRetryOrFailed = false;
  int puzzlePoints = 0;
  bool didPressNext = false; // guard for multiple Next presses

  @override
  void initState() {
    super.initState();
    resetPuzzle();
  }

  void resetPuzzle() {
    setState(() {
      isSolved = false;
      feedbackMessage = "";
      puzzlePoints = 0;
      didPressNext = false;
      // We do NOT reset usedRetryOrFailed to false if it was already true.
      // But each sub-level is a new widget anyway, so that's fine for a single puzzle.
      articles = widget.articlesMap.keys.toList();
      descriptions = widget.articlesMap.values.toList();
      articles.shuffle();
      descriptions.shuffle();
      userMatches = {for (var a in widget.articlesMap.keys) a: null};
    });
  }

  void checkSolution() {
    bool correct = true;
    for (var art in widget.articlesMap.keys) {
      if (userMatches[art] != widget.articlesMap[art]) {
        correct = false;
        break;
      }
    }
    if (correct) {
      setState(() {
        isSolved = true;
        puzzlePoints = usedRetryOrFailed ? 3 : 5;
        feedbackMessage =
            "All matches correct! You earned $puzzlePoints points.\nPress Next →";
      });
    } else {
      setState(() {
        usedRetryOrFailed = true; // They got it wrong
        feedbackMessage = "Some matches are incorrect. Adjust or Retry.";
      });
    }
  }

  void onRetry() {
    usedRetryOrFailed = true;
    resetPuzzle();
  }

  void onNext() {
    if (didPressNext) return;
    didPressNext = true;

    if (isSolved) {
      // Pass points up to the parent
      widget.onPuzzleComplete(puzzlePoints);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Match each Article to its correct Description:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        // Drop targets (descriptions)
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: descriptions.map((desc) {
            return DragTarget<String>(
              onAccept: (article) {
                setState(() {
                  userMatches[article] = desc;
                  articles.remove(article);
                });
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 220,
                  height: 60,
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        const Text(
          'Drag these Articles onto the correct descriptions:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: articles.map((art) {
            return Draggable<String>(
              data: art,
              feedback: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    art,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              childWhenDragging: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  art,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  art,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        if (feedbackMessage.isNotEmpty)
          Text(
            feedbackMessage,
            style: const TextStyle(color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isSolved ? null : checkSolution,
              style: ElevatedButton.styleFrom(
                backgroundColor: saffron,
                foregroundColor: white,
              ),
              child: const Text("Check"),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: isSolved ? null : onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: white,
              ),
              child: const Text("Retry"),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: isSolved ? onNext : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                foregroundColor: white,
              ),
              child: const Text("Next"),
            ),
          ],
        ),
      ],
    );
  }
}

// -----------------------------------------------------
// 6. LEVEL THREE: SCENARIO-BASED MULTIPLE CHOICE (10 Qs)
//    Wrong answers show correct immediately; fun facts on correct
// -----------------------------------------------------
class LevelThreeQuiz extends StatefulWidget {
  const LevelThreeQuiz({Key? key}) : super(key: key);

  @override
  State<LevelThreeQuiz> createState() => _LevelThreeQuizState();
}

class _LevelThreeQuizState extends State<LevelThreeQuiz> {
  // 10 scenario-based questions
  final List<Question> questions = [
    Question(
      scenario: "A student is denied admission to a public school due to religion. Which right is violated?",
      options: [
        "Right to Equality",
        "Right to Freedom of Religion",
        "Right against Exploitation",
        "Cultural and Educational Rights"
      ],
      correctIndex: 0,
    ),
    Question(
      scenario: "Workers are forced to work without pay under threat. Which right is violated?",
      options: [
        "Right to Freedom",
        "Right to Equality",
        "Right against Exploitation",
        "Right to Freedom of Religion"
      ],
      correctIndex: 2,
    ),
    Question(
      scenario: "A journalist is punished for criticizing the government. Which right is threatened?",
      options: [
        "Right to Freedom of Speech",
        "Right to Equality",
        "Right to Education",
        "Right to Freedom of Religion"
      ],
      correctIndex: 0,
    ),
    Question(
      scenario: "A religious group is stopped from peacefully assembling. Which right is denied?",
      options: [
        "Right to Freedom of Religion",
        "Right to Assemble Peacefully",
        "Right to Education",
        "Cultural and Educational Rights"
      ],
      correctIndex: 1,
    ),
    Question(
      scenario: "A child is made to work in a factory instead of going to school. Which right is violated?",
      options: [
        "Right to Education",
        "Right to Equality",
        "Right to Freedom of Speech",
        "Right against Exploitation"
      ],
      correctIndex: 0,
    ),
    Question(
      scenario: "A community is prevented from establishing its own school. Which right is violated?",
      options: [
        "Right to Equality",
        "Cultural and Educational Rights",
        "Right to Freedom of Religion",
        "Right to Property"
      ],
      correctIndex: 1,
    ),
    Question(
      scenario: "A citizen is not allowed to practice their faith publicly. Which right is restricted?",
      options: [
        "Right to Equality",
        "Right to Freedom",
        "Right against Exploitation",
        "Right to Freedom of Religion"
      ],
      correctIndex: 3,
    ),
    Question(
      scenario: "Police arrest someone without telling them the charges or giving them a chance for defense. Which right is affected?",
      options: [
        "Right to Life & Personal Liberty",
        "Right to Freedom of Religion",
        "Right to Education",
        "Right to Constitutional Remedies"
      ],
      correctIndex: 0,
    ),
    Question(
      scenario: "A person is denied the opportunity to vote based on caste. Which principle is violated?",
      options: [
        "Right to Equality",
        "Freedom of Expression",
        "Right to Education",
        "Right against Exploitation"
      ],
      correctIndex: 0,
    ),
    Question(
      scenario: "A worker is not paid the minimum wage mandated by law. Which fundamental right is impacted?",
      options: [
        "Right to Equality",
        "Right to Constitutional Remedies",
        "Right against Exploitation",
        "Cultural and Educational Rights"
      ],
      correctIndex: 2,
    ),
  ];

  // Random fun facts about the Indian Constitution
  final List<String> funFacts = [
    "The Indian Constitution is the longest written constitution in the world.",
    "It took 2 years, 11 months, and 17 days to complete the Constitution.",
    "The Constituent Assembly had 299 members.",
    "Dr. B.R. Ambedkar is known as the chief architect of the Constitution.",
    "The Constitution originally had 395 articles; now it has over 470.",
    "The Preamble was amended only once, by the 42nd Amendment in 1976.",
    "India celebrates Constitution Day on November 26 each year.",
    "Fundamental Rights are in Part III of the Constitution.",
    "Directive Principles are in Part IV of the Constitution.",
    "The original Constitution is hand-written in Hindi and English."
  ];

  int currentQuestionIndex = 0;
  int score = 0;
  bool showingAnswerFeedback = false; // To prevent double-taps

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 3: Scenario Quiz'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: customGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Progress bar
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              minHeight: 8,
            ),
            const SizedBox(height: 16),
            Text(
              'Question ${currentQuestionIndex + 1} of ${questions.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              question.scenario,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ...List.generate(question.options.length, (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: saffron,
                    foregroundColor: white,
                  ),
                  onPressed: showingAnswerFeedback
                      ? null
                      : () => checkAnswer(index, context),
                  child: Text(question.options[index]),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  void checkAnswer(int selectedIndex, BuildContext context) {
    setState(() => showingAnswerFeedback = true);

    final question = questions[currentQuestionIndex];
    final isCorrect = selectedIndex == question.correctIndex;

    if (isCorrect) {
      score++;
      // Show a random fun fact
      showSnackBar(context, "Correct!", randomFunFact());
    } else {
      // Show which one is correct
      final correctOption = question.options[question.correctIndex];
      showSnackBar(context, "Wrong!", "Correct answer: $correctOption");
    }

    // Wait 2 seconds, then go to the next question
    Timer(const Duration(seconds: 2), () {
      setState(() => showingAnswerFeedback = false);

      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
        });
      } else {
        // Done with the quiz => add to global score
        GlobalScore.total += score;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => CompletionScreen(
              score: score,
              total: questions.length,
            ),
          ),
        );
      }
    });
  }

  String randomFunFact() {
    final randomIndex = Random().nextInt(funFacts.length);
    return funFacts[randomIndex];
  }

  void showSnackBar(BuildContext context, String title, String detail) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$title\n$detail"),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}

/// Simple model for scenario-based questions
class Question {
  final String scenario;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.scenario,
    required this.options,
    required this.correctIndex,
  });
}

// -----------------------------------------------------
// 7. COMPLETION SCREEN (after Level 3)
// -----------------------------------------------------
class CompletionScreen extends StatelessWidget {
  final int score;
  final int total;

  const CompletionScreen({Key? key, required this.score, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message =
        'You scored $score out of $total in the Level 3 Quiz.\n'
        'Global Score: ${GlobalScore.total}\n\n'
        'Great job completing all levels!';

    return Scaffold(
      appBar: AppBar(title: const Text('All Levels Complete')),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: customGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
                foregroundColor: white,
              ),
              onPressed: () {
                // Go back to level select or welcome screen
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}
