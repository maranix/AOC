import 'dart:io' as io;

/// {@template advent_day}
/// AdventDay is a class interface which can be extended to quickly setup
/// the base for current day with common methods and some helpful utility functions
/// to reduce complexity and enforce DRY approach.
///
/// To get started extend any class with ``AdventDay`` then override the
/// [year] and [day] named super parameters.
///
/// ```dart
/// class Foo extends AdventDay {
///   const Foo(): super(year: 2022, day: 1);
/// }
/// ```
///
/// # Methods
///
/// The following interface also implements two generic functions [part1] and [part2]
/// of type [T]. These functions can be used by overriding implementation with the
/// solution of AOC day and its part.
///
/// By default these functions will throw an [UnimplementedError].
///
/// # Utility
///
/// This interface also offers some helpful utility functions for reading and parsing
/// the input.
///
/// [testInput()]: Reads the test input and returns a [String].
/// [prodInput()]: Reads the prod input and returns a [String].
/// [parseLinesFromInput()]: Takes a parameter of type [String] and returns a [List<String>] by splitting the input by newline(\n).
/// {@endtemplate}
abstract class AdventDay {
  /// {@macro advent_day}
  AdventDay({required int year, required int day})
      : _year = year,
        _day = day;

  /// Advent of Code Year
  final int _year;

  /// Advent of Code Day
  final int _day;

  /// Implementation of part1 solution
  T partOne<T>() => throw UnimplementedError(
      "Method partOne has not been overriden. Do override the function with solution implementation");

  /// Implementation of part2 solution
  T partTwo<T>() => throw UnimplementedError(
      "Method partTwo has not been overriden. Do override the function with solution implementation");

  String testInput() =>
      io.File("inputs/$_year/day$_day.test").readAsStringSync();
  String prodInput() =>
      io.File("inputs/$_year/day$_day.prod").readAsStringSync();

  List<String> parseLinesFromInput(String input) => input.split("\n");
}
