import 'package:flutter/material.dart';

import '../models/question.dart';
import '../models/quiz_category.dart';

final List<QuizCategory> quizCategories = [
  QuizCategory(
    name: 'Science',
    icon: Icons.science,
    questions: [
      Question(
        questionText: 'What planet is known as the Red Planet?',
        options: [
          'Earth',
          'Mars',
          'Venus',
          'Jupiter',
        ],
        correctAnswer: 'Mars',
      ),
      Question(
        questionText: 'Water boils at?',
        options: [
          '50°C',
          '75°C',
          '100°C',
          '150°C',
        ],
        correctAnswer: '100°C',
      ),
      Question(
        questionText: 'Chemical symbol of Oxygen?',
        options: [
          'O',
          'Ox',
          'Og',
          'Om',
        ],
        correctAnswer: 'O',
      ),
      Question(
        questionText: 'Largest organ in human body?',
        options: [
          'Heart',
          'Skin',
          'Liver',
          'Brain',
        ],
        correctAnswer: 'Skin',
      ),
      Question(
        questionText: 'Sun is a?',
        options: [
          'Planet',
          'Star',
          'Galaxy',
          'Satellite',
        ],
        correctAnswer: 'Star',
      ),
    ],
  ),

  QuizCategory(
    name: 'Technology',
    icon: Icons.computer,
    questions: [
      Question(
        questionText: 'Flutter uses which language?',
        options: [
          'Java',
          'Kotlin',
          'Dart',
          'Python',
        ],
        correctAnswer: 'Dart',
      ),
      Question(
        questionText: 'Google developed?',
        options: [
          'Flutter',
          'Laravel',
          'React',
          'Vue',
        ],
        correctAnswer: 'Flutter',
      ),
      Question(
        questionText: 'CPU stands for?',
        options: [
          'Central Processing Unit',
          'Computer Process Unit',
          'Central Program Utility',
          'Core Process Unit',
        ],
        correctAnswer:
        'Central Processing Unit',
      ),
      Question(
        questionText: 'Android is?',
        options: [
          'Browser',
          'OS',
          'Database',
          'Language',
        ],
        correctAnswer: 'OS',
      ),
      Question(
        questionText: 'Firebase is?',
        options: [
          'Backend Service',
          'Game',
          'OS',
          'Browser',
        ],
        correctAnswer:
        'Backend Service',
      ),
    ],
  ),

  QuizCategory(
    name: 'Sports',
    icon: Icons.sports_soccer,
    questions: [
      Question(
        questionText:
        'How many players in a football team?',
        options: [
          '9',
          '10',
          '11',
          '12',
        ],
        correctAnswer: '11',
      ),
      Question(
        questionText:
        'Which country won FIFA 2022?',
        options: [
          'France',
          'Brazil',
          'Argentina',
          'Germany',
        ],
        correctAnswer: 'Argentina',
      ),
      Question(
        questionText:
        'Cricket national sport of?',
        options: [
          'India',
          'Australia',
          'England',
          'Canada',
        ],
        correctAnswer: 'England',
      ),
      Question(
        questionText:
        'Olympics held every?',
        options: [
          '2 Years',
          '3 Years',
          '4 Years',
          '5 Years',
        ],
        correctAnswer: '4 Years',
      ),
      Question(
        questionText:
        'Tennis uses?',
        options: [
          'Bat',
          'Racket',
          'Stick',
          'Glove',
        ],
        correctAnswer: 'Racket',
      ),
    ],
  ),

  QuizCategory(
    name: 'History',
    icon: Icons.history_edu,
    questions: [
      Question(
        questionText:
        'Who discovered America?',
        options: [
          'Newton',
          'Columbus',
          'Einstein',
          'Galileo',
        ],
        correctAnswer: 'Columbus',
      ),
      Question(
        questionText:
        'World War II ended in?',
        options: [
          '1945',
          '1940',
          '1939',
          '1950',
        ],
        correctAnswer: '1945',
      ),
      Question(
        questionText:
        'Taj Mahal is in?',
        options: [
          'Bangladesh',
          'Pakistan',
          'India',
          'Nepal',
        ],
        correctAnswer: 'India',
      ),
      Question(
        questionText:
        'Pyramids are in?',
        options: [
          'Egypt',
          'China',
          'Italy',
          'Turkey',
        ],
        correctAnswer: 'Egypt',
      ),
      Question(
        questionText:
        'Liberation War of Bangladesh?',
        options: [
          '1971',
          '1975',
          '1965',
          '1980',
        ],
        correctAnswer: '1971',
      ),
    ],
  ),

  QuizCategory(
    name: 'General Knowledge',
    icon: Icons.psychology,
    questions: [
      Question(
        questionText:
        'Capital of Bangladesh?',
        options: [
          'Chattogram',
          'Khulna',
          'Dhaka',
          'Rajshahi',
        ],
        correctAnswer: 'Dhaka',
      ),
      Question(
        questionText:
        'National flower of Bangladesh?',
        options: [
          'Rose',
          'Lily',
          'Shapla',
          'Sunflower',
        ],
        correctAnswer: 'Shapla',
      ),
      Question(
        questionText:
        'How many continents?',
        options: [
          '5',
          '6',
          '7',
          '8',
        ],
        correctAnswer: '7',
      ),
      Question(
        questionText:
        'Largest ocean?',
        options: [
          'Atlantic',
          'Indian',
          'Pacific',
          'Arctic',
        ],
        correctAnswer: 'Pacific',
      ),
      Question(
        questionText:
        'Fastest land animal?',
        options: [
          'Lion',
          'Tiger',
          'Horse',
          'Cheetah',
        ],
        correctAnswer: 'Cheetah',
      ),
    ],
  ),
];