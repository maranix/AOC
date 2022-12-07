import 'dart:io' as io;

// TODO: Optimize and refactor the solution
class Day3 {
  static final _path = io.Directory.current.path;

  static final List<String> _priorities =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

  // 7763
  int part1() {
    final listOfContents = io.File('$_path/inputs/day3.txt').readAsLinesSync();

    return _splitCompartments(listOfContents).entries.fold(
          0,
          (previousValue, element) =>
              previousValue +
              _priorityFromCompartments(element.key, element.value),
        );
  }

  // 2569
  int part2() {
    final listOfContents = io.File('$_path/inputs/day3.txt').readAsLinesSync();

    return _groupOfRacksacks(listOfContents).fold(
      0,
      (previousValue, element) => previousValue + _priorityFromGroup(element),
    );
  }

  Map<String, String> _splitCompartments(List<String> input) {
    final compartments = <String, String>{};

    for (final rucksack in input) {
      final comp1 =
          rucksack.substring(0, rucksack.length ~/ 2).split('').toSet().join();

      final comp2 = rucksack
          .substring(rucksack.length ~/ 2, rucksack.length)
          .split('')
          .toSet()
          .join();

      compartments.addAll({
        comp1: comp2,
      });
    }

    return compartments;
  }

  List<List<String>> _groupOfRacksacks(List<String> input) {
    final group = <List<String>>[];

    for (int i = 0; i < input.length; i += 3) {
      group.add(
        input.getRange(i, input.length).toList(),
      );
    }

    return group;
  }

  int _priorityFromCompartments(String comp1, String comp2) {
    for (final char in comp1.split('')) {
      if (comp2.contains(char)) {
        return _priorities.indexWhere(
              (element) => element == char,
            ) +
            1;
      }
    }

    return 0;
  }

  int _priorityFromGroup(List<String> group) {
    for (final char in group[0].split('')) {
      if (group[1].contains(char) && group[2].contains(char)) {
        return _priorities.indexWhere(
              (element) => element == char,
            ) +
            1;
      }
    }

    return 0;
  }
}
