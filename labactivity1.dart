import 'dart:io';

void main() {
  bool run = true;

  while (run) {
    print(' Menu ');
    print('1.Budget tracker');
    print('2.Grade calculator');
    print('3.Exit');
    stdout.write('Choice: ');
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      stdout.write('Enter monthly allowance: ');
      double allowance = double.parse(stdin.readLineSync() ?? '0');

      if (allowance <= 0) {
        print('Invalid allowance!');
        continue;
      }

      stdout.write('Food expense: ');
      double food = double.parse(stdin.readLineSync() ?? '0');

      stdout.write('Transport expense: ');
      double transport = double.parse(stdin.readLineSync() ?? '0');

      stdout.write('School materials expense: ');
      double school = double.parse(stdin.readLineSync() ?? '0');

      stdout.write('Others expense: ');
      double others = double.parse(stdin.readLineSync() ?? '0');

      double totalExpenses = food + transport + school + others;
      double remaining = allowance - totalExpenses;

      double percentFood = (food / allowance) * 100;
      double percentTransport = (transport / allowance) * 100;
      double percentSchool = (school / allowance) * 100;
      double percentOthers = (others / allowance) * 100;

      print(' Summary ');
      print('Total Expenses: ' + totalExpenses.toString());
      print('Remaining: ' + remaining.toString());
      print('Food: ' + percentFood.toStringAsFixed(1) + '%');
      print('Transport: ' + percentTransport.toStringAsFixed(1) + '%');
      print('School: ' + percentSchool.toStringAsFixed(1) + '%');
      print('Others: ' + percentOthers.toStringAsFixed(1) + '%');

      print(' Status ');
      if (totalExpenses > allowance) {
        print('Warning: Your plan exceeds your allowance!');
      } else if (totalExpenses == allowance) {
        print('You are spending exactly your allowance. No savings left.');
      } else if (totalExpenses < allowance && remaining >= allowance * 0.20) {
        print('Great! You are saving at least 20% of your allowance.');
      } else {
        print('You are within budget, but your savings are less than 20%.');
      }

    } else if (choice == '2') {
      stdout.write('How many quizzes? ');
      int numQuizzes = int.parse(stdin.readLineSync() ?? '0');

      double totalQuiz = 0;
      int count = 0;

      for (int i = 0; i < numQuizzes; i++) {
        count++;
        stdout.write('Quiz ' + count.toString() + ' score: ');
        double score = double.parse(stdin.readLineSync() ?? '0');
        totalQuiz += score;
      }

      double quizAverage = totalQuiz / numQuizzes;

      stdout.write('Midterm score: ');
      double midtermScore = double.parse(stdin.readLineSync() ?? '0');

      stdout.write('Final score: ');
      double finalScore = double.parse(stdin.readLineSync() ?? '0');

      double finalGrade = (quizAverage * 0.30) + (midtermScore * 0.30) + (finalScore * 0.40);

      print(' Result ');
      print('Quiz Average: ' + quizAverage.toStringAsFixed(2));
      print('Final Grade: ' + finalGrade.toStringAsFixed(2));

      if (finalGrade >= 90) {
        print('Excellent, Aliah! Grade: A');
      } else if (finalGrade >= 80) {
        print('Very good, Aliah! Grade: B');
      } else if (finalGrade >= 70) {
        print('Good, Aliah! Grade: C');
      } else if (finalGrade >= 60) {
        print('Needs improvement. Grade: D');
      } else {
        print('At risk, Aliah. Grade: F');
      }

    } else if (choice == '3') {
      print('Exit program.');
      run = false;
    } else {
      print('Invalid choice!');
    }
  }
}