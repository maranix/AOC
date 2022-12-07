import 'dart:io' as io;

class Day6 {
  static final _path = io.Directory.current.path;

  // 1582
  int part1() {
    final datastream = io.File('$_path/inputs/day6.txt').readAsStringSync();

    // First marker will arrive after 3 characters, it is mentioned in the prompt
    return firstMarker(datastream, 4);
  }

  // 3588
  int part2() {
    final datastream = io.File('$_path/inputs/day6.txt').readAsStringSync();

    return firstMarker(datastream, 14);
  }

  int firstMarker(String input, int markerLength) {
    for (int i = markerLength; i < input.length; i++) {
      // Create a substring of exactly 4 characters from the data stream
      //
      // On each iteration in it'll create a substring starting from (0,4) -> (1,5) -> (2,6) -> ...
      // until we react the length of the datastream.
      //
      // Split the substring by each character and turn it into a Set to remove duplicate characters.
      //
      // Check if the created Set is of the length as the markerLength.
      // Return i if it is where i = index where the first marker arrives.
      final marker = input.substring(i - markerLength, i).split('').toSet();

      if (marker.length == markerLength) {
        return i;
      }
    }

    return 0;
  }
}
