import 'dart:io';
void main() {
     dynamic mark = new Map();
     double cgpa; 
     int sum = 0;
     print("Enter mark[1]");
     stdout.writeln();
     mark[1] = stdin.readLineSync();
     print("Enter mark[2]");
     stdout.writeln();
     mark[2] = stdin.readLineSync();
     print("Enter mark[3]");
     stdout.writeln();
     mark[3] = stdin.readLineSync();
     print("Enter mark[4]");
     stdout.writeln();
     mark[4] = stdin.readLineSync();
     print("Enter mark[5]");
     stdout.writeln();
     mark[5] = stdin.readLineSync();
  
     for(var i = 1; i <= mark.length; i++){
        sum += int.parse(mark[i]);
     }
     
     int unit = 50;
     cgpa = sum / unit;
     print("cgpa = $cgpa");
     double percentage = cgpa * 9.5;
     print("percantage = $percentage");
}