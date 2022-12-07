import 'dart:io' as io;

// TODO: Optimize and refactor the solution
class Day2 {
  final _pwd = io.Directory.current.path;

  static const rock = 1;
  static const paper = 2;
  static const scissors = 3;

  // 15632
  int part1() {
    final input = io.File('$_pwd/inputs/day2.txt').readAsLinesSync();

    final List<int> points = [];

    for (final row in input) {
      final deals = row.split(' ');

      points.add(_wonPoints(deals));
    }

    return _sum(points);
  }

  // 14416
  int part2() {
    final input = io.File('$_pwd/inputs/day2.txt').readAsLinesSync();

    final List<int> points = [];

    for (final row in input) {
      final deals = row.split(' ');

      final point = _winDrawLosePoints(deals);

      points.add(point);
    }

    return _sum(points);
  }

  int _wonPoints(List<String> input) {
    int sum = 0;

    switch (input.first) {
      case 'A':
        if (input.last == 'Y') {
          sum += 6 + paper;
        } else if (input.last == 'X') {
          // Draw
          sum += 3 + rock;
        } else {
          // Lost becuase dealt Scissors
          sum += scissors;
        }
        break;
      case 'B':
        if (input.last == 'Z') {
          sum += 6 + scissors;
        } else if (input.last == 'Y') {
          // Draw
          sum += 3 + paper;
        } else {
          // Lost becuase dealt Rock
          sum += rock;
        }
        break;
      case 'C':
        if (input.last == 'X') {
          sum += 6 + rock;
        } else if (input.last == 'Z') {
          // Draw
          sum += 3 + scissors;
        } else {
          // Lost becuase dealt Paper
          sum += paper;
        }
        break;
    }

    return sum;
  }

  int _winDrawLosePoints(List<String> input) {
    int sum = 0;

    switch (input.last) {
      case 'X':
        if (input.first == 'A') {
          // Losing with Scissors against Rock
          sum += scissors;
        }
        if (input.first == 'B') {
          // Losing with Rock against Paper
          sum += rock;
        }
        if (input.first == 'C') {
          // Losing with Paper against Scissors
          sum += paper;
        }
        break;
      case 'Y':
        if (input.first == 'A') {
          // Draw with Rock
          sum += rock + 3;
        }
        if (input.first == 'B') {
          // Draw with Paper
          sum += paper + 3;
        }
        if (input.first == 'C') {
          // Draw with Scissors
          sum += scissors + 3;
        }
        break;
      case 'Z':
        if (input.first == 'A') {
          // Win with Paper
          sum += paper + 6;
        }
        if (input.first == 'B') {
          // Win with Scissors
          sum += scissors + 6;
        }
        if (input.first == 'C') {
          // Win with Rock
          sum += rock + 6;
        }
        break;
    }

    return sum;
  }

  int _sum(List<int> input) => input.reduce(
        (value, element) => value + element,
      );
}
