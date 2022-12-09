import 'dart:convert';
import 'dart:io';

void day01() {
  File('./bin/day01/input.txt').readAsString().then((String contents) {
    part2(LineSplitter().convert(contents));
  });
}

void part1(List<String> input) {
  int fuelSum = 0;
  for (String mass in input) {
    int massInt = int.parse(mass);
    fuelSum += getFuel(massInt);
  }
  print('Total fuel needed is $fuelSum');
}

void part2(List<String> input) {
  int fuelSum = 0;
  for (String mass in input) {
    int massInt = int.parse(mass);
    fuelSum += getFuelRec(massInt) - massInt;
  }
  print('Total fuel needed is $fuelSum');
}

int getFuel(int mass) {
  return (mass/3).floor()-2;
}

int getFuelRec(int mass) {
  if (mass < 0) {
    return 0;
  }
  return mass+getFuelRec((mass/3).floor()-2);
}
