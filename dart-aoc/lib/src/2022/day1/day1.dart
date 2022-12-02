import 'dart:io' as io;

// TODO: Optimize and refactor the solution
class Day1 {
  final _pwd = io.Directory.current.path;

  int part1() {
    final input = io.File('$_pwd/inputs/day1.txt').readAsLinesSync();

    final List<int> calories = [];
    int calSum = 0;

    for (final String n in input) {
      if (n == '') {
        calories.add(calSum);
        calSum = 0;
      } else {
        calSum += int.parse(n);
      }
    }

    final maxCal = _getMaxValue(calories);

    return maxCal;
  }

  int part2() {
    final pwd = io.Directory.current.path;
    final input = io.File('$pwd/inputs/day1.txt').readAsLinesSync();

    final List<int> calories = [];
    final List<int> top3 = [];
    int calSum = 0;

    for (final String n in input) {
      if (n == '') {
        calories.add(calSum);
        calSum = 0;
      } else {
        calSum += int.parse(n);
      }
    }

    for (int i = 0; i < 3; i++) {
      final max = _getMaxValue(calories);
      top3.add(max);
      calories.remove(max);
    }

    return _sum(top3);
  }

  int _getMaxValue(List<int> input) => input.reduce(
        (value, element) => value > element ? value : element,
      );

  int _sum(List<int> input) => input.reduce(
        (value, element) => value + element,
      );
}
