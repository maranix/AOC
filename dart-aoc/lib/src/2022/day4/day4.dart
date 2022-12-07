import 'dart:io' as io;

// Solution credits to Darren Austin
// TODO: Implement my own solution
class Day4 {
  static final _path = io.Directory.current.path;

  // 511
  int part1() {
    final listOfContents = io.File('$_path/inputs/day4.txt').readAsLinesSync();

    return listOfContents.map(RangePair.from).where(RangePair.contained).length;
  }

  // 821
  int part2() {
    final listOfContents = io.File('$_path/inputs/day4.txt').readAsLinesSync();

    return listOfContents
        .map(RangePair.from)
        .where(RangePair.intersected)
        .length;
  }
}

class RangePair {
  const RangePair(this.firstElf, this.secondElf);

  factory RangePair.from(String input) {
    final pair = input.split(',');
    return RangePair(
      Range.from(pair.first),
      Range.from(pair.last),
    );
  }

  final Range firstElf;
  final Range secondElf;

  static bool contained(RangePair pair) =>
      pair.firstElf.contains(pair.secondElf) ||
      pair.secondElf.contains(pair.firstElf);

  static bool intersected(RangePair pair) =>
      pair.firstElf.intersecting(pair.secondElf) ||
      pair.secondElf.intersecting(pair.firstElf);
}

class Range {
  const Range(this.start, this.end);

  factory Range.from(String input) {
    final range = input.split('-').map(int.parse);
    return Range(range.first, range.last);
  }

  final int start;
  final int end;

  bool contains(Range other) => start <= other.start && end >= other.end;

  bool intersecting(Range other) =>
      other.start <= start && start <= other.end ||
      other.start <= end && end <= other.end;
}
