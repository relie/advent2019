import 'dart:io';
import '../utils.dart';

void day02() {
  File('./bin/day02/input.txt').readAsString().then((String contents) {
    // part1(contents.split(','));
    part2(contents.split(','));
  });
}

void part1(List<String> input) {
  List<int> inputInt = convertListSI(input);
  print('Start list is $inputInt.');
  for (int r = 0; r < input.length/4; r++) {
    int baseIdx = 4*r;
    int inst = inputInt[baseIdx];
    print('Instruction is $inst.');
    if (inst == 99) {
      break;
    } else {
      int srcIdx1 = inputInt[baseIdx+1];
      int srcIdx2 = inputInt[baseIdx+2];
      int destIdx = inputInt[baseIdx+3];
      if (inst == 1) {
        inputInt[destIdx] = inputInt[srcIdx1]+inputInt[srcIdx2];
      } else if (inst == 2) {
        inputInt[destIdx] = inputInt[srcIdx1]*inputInt[srcIdx2];
      }
    }
  }
  print('Final list is $inputInt.');
}

void part2(List<String> input) {
  for (int r = 0; r < 100; r++) {
    for (int l = 0; l < 100; l++) {
      int output = runIntcodeProgram(input, r, l);
      // print('Output is $output');
      if (output == 19690720) {
        print('Inputs should be $r & $l for an output of 19690720.');
        print('Answer is ${(100*r)+l}');
      }
    }
  }
}

int runIntcodeProgram(List<String> insts, int input1, int input2) {
  List<int> inputIntcode = convertListSI(insts);
  inputIntcode[1] = input1;
  inputIntcode[2] = input2;

  for (int r = 0; r < inputIntcode.length/4; r++) {
    int baseIdx = 4*r;
    int inst = inputIntcode[baseIdx];
    if (inst == 99) {
      break;
    } else {
      int srcIdx1 = inputIntcode[baseIdx+1];
      int srcIdx2 = inputIntcode[baseIdx+2];
      int destIdx = inputIntcode[baseIdx+3];
      if (inst == 1) {
        inputIntcode[destIdx] = inputIntcode[srcIdx1]+inputIntcode[srcIdx2];
      } else if (inst == 2) {
        inputIntcode[destIdx] = inputIntcode[srcIdx1]*inputIntcode[srcIdx2];
      }
    }
  }

  return inputIntcode[0];
}