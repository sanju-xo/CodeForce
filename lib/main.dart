import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const DemotivationApp());
}

class DemotivationApp extends StatelessWidget {
  const DemotivationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Why Even Try?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const DemotivationHome(),
    );
  }
}

class DemotivationHome extends StatefulWidget {
  const DemotivationHome({super.key});

  @override
  State<DemotivationHome> createState() => _DemotivationHomeState();
}

class _DemotivationHomeState extends State<DemotivationHome> {
  final TextEditingController _inputController = TextEditingController();

  // Categorized demotivational quotes
  final Map<String, List<String>> _categoryQuotes = {
    'study': [
      "Why study? You'll forget it all anyway.",
      "Your textbook is laughing at your effort.",
      "Knowledge is power. Too bad you're powerless.",
      "Study hard, fail harder.",
      "Your brain cells are filing for unemployment.",
    ],
    'work': [
      "Work harder! Your boss needs another yacht.",
      "Monday motivation: it's all downhill from here.",
      "Your career path leads to a dead end.",
      "Productivity is just organized procrastination.",
      "Success is 1% inspiration, 99% disappointment.",
    ],
    'exercise': [
      "No pain, no gain. Mostly just pain though.",
      "Your muscles are as weak as your willpower.",
      "Fitness goals? More like fitness fails.",
      "Every rep brings you closer to giving up.",
      "Your gym membership is your biggest expense mistake.",
    ],
    'love': [
      "Love is blind. And deaf. And dumb.",
      "Your heart will be broken anyway.",
      "Relationships: preparing you for loneliness.",
      "Love conquers all... except your personality.",
      "Dating apps: where dreams go to die.",
    ],
    'money': [
      "Money can't buy happiness. Neither can poverty.",
      "Your bank account and your self-worth: both empty.",
      "Rich or poor, you'll still be miserable.",
      "Money talks. Yours says 'goodbye'.",
      "Financial planning: planning your bankruptcy.",
    ],
  };

  final List<String> _generalQuotes = [
    "Why bother? It'll probably fail anyway.",
    "Dreams are just unpaid nightmares.",
    "You tried. That was the mistake.",
    "Keep going — deeper into despair.",
    "Believe in yourself. Or don't. Doesn't matter.",
    "Every day is a second chance… to mess up.",
    "Follow your dreams. Straight into the wall.",
    "It only gets worse from here.",
    "Progress is just failure in slow motion.",
  ];

  String _currentQuote = "Ask me for advice... I dare you.";

  void _generateQuoteFromInput() {
    final input = _inputController.text.toLowerCase().trim();

    if (input.isEmpty) {
      setState(() {
        _currentQuote = "You can't even type properly. How pathetic.";
      });
      return;
    }

    List<String> relevantQuotes = _generalQuotes;

    // Check for keywords in input
    for (String category in _categoryQuotes.keys) {
      if (input.contains(category) ||
          _getRelatedKeywords(
            category,
          ).any((keyword) => input.contains(keyword))) {
        relevantQuotes = _categoryQuotes[category]!;
        break;
      }
    }

    final random = Random();
    setState(() {
      _currentQuote = relevantQuotes[random.nextInt(relevantQuotes.length)];
    });

    _inputController.clear();
  }

  List<String> _getRelatedKeywords(String category) {
    switch (category) {
      case 'study':
        return [
          'exam',
          'test',
          'school',
          'homework',
          'learn',
          'book',
          'college',
          'university',
        ];
      case 'work':
        return [
          'job',
          'career',
          'office',
          'boss',
          'salary',
          'project',
          'meeting',
        ];
      case 'exercise':
        return [
          'gym',
          'workout',
          'fitness',
          'weight',
          'running',
          'muscle',
          'health',
        ];
      case 'love':
        return [
          'relationship',
          'dating',
          'girlfriend',
          'boyfriend',
          'crush',
          'heart',
          'romance',
        ];
      case 'money':
        return [
          'cash',
          'salary',
          'rich',
          'poor',
          'expensive',
          'budget',
          'finance',
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey[200]!, Colors.grey[400]!],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Text(
                    "Demotivational Advisor \n💀",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Your source for brutally honest advice",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Quote Display Card
                  Container(
                    constraints: BoxConstraints(minHeight: 150),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      border: Border.all(color: Colors.grey[300]!, width: 2),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.format_quote,
                          size: 32,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _currentQuote,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[800],
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Input Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _inputController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText:
                                "Ask me for advice about anything...\n(study, work, love, money, exercise)",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey[600]!,
                                width: 2,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.grey[600],
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          onSubmitted: (_) => _generateQuoteFromInput(),
                        ),
                        const SizedBox(height: 20),

                        // Ask Button
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton.icon(
                            onPressed: _generateQuoteFromInput,
                            icon: const Icon(Icons.psychology_alt, size: 24),
                            label: const Text(
                              "Get Demotivated",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[600],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Footer
                  Text(
                    "Remember: Your dreams are valid... but probably unattainable 😈",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
