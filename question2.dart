// Question 2: Collections & Control Flow (Difficulty: 2/5) ⭐⭐
/// EXPECTED OUTPUT:
/// Student Scores: {Alice: <random>, Bob: <random>, ...}
/// Highest Score: <Name> with <Score>
/// Lowest Score: <Name> with <Score>
/// Average Score: <Value>
/// Alice: <Score> (Category)
/// ...
library;


import 'dart:math';

void main() {
  // 1. Student names
  final studentNames = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];

  // 2. Scores map
  final studentScores = <String, int>{};

  final random = Random();

  // 3. Assign random scores
  for (final student in studentNames) {
    studentScores[student] = 60 + random.nextInt(41); // 60–100
  }

  // 4. Find highest, lowest, average
  var highestStudent = '';
  var lowestStudent = '';
  var highestScore = 0;
  var lowestScore = 100;
  var total = 0;

  for (final entry in studentScores.entries) {
    final name = entry.key;
    final score = entry.value;

    total += score;

    if (score > highestScore) {
      highestScore = score;
      highestStudent = name;
    }

    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = name;
    }
  }

  final averageScore = total / studentNames.length;

  print('Student Scores: $studentScores');
  print('Highest Score: $highestStudent with $highestScore');
  print('Lowest Score: $lowestStudent with $lowestScore');
  print('Average Score: $averageScore');

  // 5. Categorization using switch
  for (final student in studentNames) {
    final score = studentScores[student] ?? 0;
    var category = '';

    switch (score ~/ 10) {
      case 10:
      case 9:
        category = 'Excellent';
        break;
      case 8:
        category = 'Good';
        break;
      case 7:
        category = 'Average';
        break;
      default:
        category = 'Needs Improvement';
    }

    print('$student: $score ($category)');
  }
}