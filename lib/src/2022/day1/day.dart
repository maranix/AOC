import 'package:aoc/src/day.dart';

class Day1 extends AdventDay {
  Day1() : super(year: 2022, day: 1);

  @override
  int partOne<int>() => _getGroupTotalFromInput(prodInput()).fold(
        0,
        (previousValue, element) =>
            previousValue > element ? previousValue : element
      ) as int;

  @override
  int partTwo<int>() {
    final groupTotal = _getGroupTotalFromInput(prodInput());
    // Sort groupTotal in ascending order
    // Largest values are now at the end of the list.
    groupTotal.sort();

    // Create a sublist of last 3 items from groupTotal
    // Return the sum of sublist.
    return groupTotal
        .sublist(
          groupTotal.length - 3,
          groupTotal.length,
        )
        .reduce(
          (value, element) => value + element,
        ) as int;
  }

  List<int> _getGroupTotalFromInput(String input) => input
      .split("\n\n")
      .map(
        (String group) => group
            .split("\n")
            .where((String line) => line.isNotEmpty)
            .map(int.parse)
            .reduce(
              (value, element) => value + element,
            ),
      )
      .toList();
}
