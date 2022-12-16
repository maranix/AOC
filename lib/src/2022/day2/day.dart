import 'package:aoc/src/day.dart';

class Day2 extends AdventDay {
  Day2() : super(year: 2022, day: 2);

  static const rock = 1;
  static const paper = 2;
  static const scissors = 3;

  @override
  int partOne<int>() => parseLinesFromInput(prodInput())
      .map(
        (e) => e.split(" "),
      )
      .map(pointsPerRound)
      .toList()
      .reduce((value, element) => value + element) as int;

  @override
  int partTwo<int>() => parseLinesFromInput(prodInput())
      .map(
        (e) => e.split(" "),
      )
      .map(roundFixingPoints)
      .toList()
      .reduce((value, element) => value + element) as int;

  int pointsPerRound(List<String> elf) {
    switch (elf.first) {
      case "A":
        if (elf.last == "Y") {
          return 6 + 2;
        } else if (elf.last == "Z") {
          return 3;
        }

        return 3 + 1;
      case "B":
        if (elf.last == "Z") {
          return 6 + 3;
        } else if (elf.last == "X") {
          return 1;
        }

        return 3 + 2;
      case "C":
        if (elf.last == "X") {
          return 6 + 1;
        } else if (elf.last == "Y") {
          return 2;
        }

        return 3 + 3;
      default:
        return 0;
    }
  }

  int roundFixingPoints(List<String> elf) {
    switch (elf.first) {
      case "A":
        if (elf.last == "Z") {
          return 6 + 2;
        } else if (elf.last == "Y") {
          return 3 + 1;
        }

        return 3;
      case "B":
        if (elf.last == "Z") {
          return 6 + 3;
        } else if (elf.last == "Y") {
          return 3 + 2;
        }

        return 1;
      case "C":
        if (elf.last == "Z") {
          return 6 + 1;
        } else if (elf.last == "Y") {
          return 3 + 3;
        }

        return 2;
      default:
        return 0;
    }
  }
}
