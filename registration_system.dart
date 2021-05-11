import 'dart:io';

class GetStudentInfo {
  dynamic department; dynamic fullName; dynamic gender; dynamic age;
  dynamic phone; dynamic email; dynamic address; dynamic bio; dynamic fees;
   
  GetStudentInfo({this.department, this.fullName, this.gender, this.age, this.phone, this.email, this.address, this.bio, this.fees});

  String toString() {
    return '\n\tStudent info\ndepartment: $department\nname: $fullName\ngender:  $gender\nage:  $age\nphone:  $phone\nemail:  $email\naddress:  $address\nbio:  $bio\nfees  $fees\n';
  }
}

welcome() {
  print(
      'Hello there, would you like to register a new student?\nEnter Yes or No:');
  var input = stdin.readLineSync();
  if (input == 'yes' || input == 'YES' || input == 'Yes') {
    entry();
  } else if (input == 'no' || input == 'No' || input == 'NO') {
    print('Do have a lovely day!');
  } else {
    print('Error\nEnter Yes or No!');
    print(
      'Would you like to register another student?\nEnter Yes or No:');
  var input = stdin.readLineSync();
  if (input == 'yes' || input == 'YES' || input == 'Yes') {
    entry();
  } else if (input == 'no' || input == 'No' || input == 'NO') {
    print('Do have a lovely day!');
  } else {
    print('\'n');
    print('Error\nEnter Yes or No!');
  }
  } 
  }

entry() {
  print("Enter student department:\n( SBSC-Unique, SBSC-Lit, SBSC-Awesome )");
  var department = stdin.readLineSync();
  if (department == 'SBSC-Unique') {
    inputData(department);
  } else if (department == 'SBSC-Awesome') {
    inputData(department);
  } else if (department == 'SBSC-Lit') {
    inputData(department);
  } else {
    print('This department does not exist!');
    print(
      'Would you like to register another student?\nEnter Yes or No:');
  var input = stdin.readLineSync();
  if (input == 'yes' || input == 'YES' || input == 'Yes') {
    entry();
  } else if (input == 'no' || input == 'No' || input == 'NO') {
    print('Do have a lovely day!');
  } else {
    print('\'n');
    print('Error\nEnter Yes or No!');
  }
  } 
}

inputData(department){
  print('Enter student full name: ');
  var name = stdin.readLineSync();
  print('Enter student gender: ');
  var gender = stdin.readLineSync();
  print('Enter student age: ');
  var age = stdin.readLineSync();
  print('Enter student phone number: ');
  var phone = stdin.readLineSync();
  print('Enter student email address: ');
  var email = stdin.readLineSync();
  print('Enter student residential address: ');
  var address = stdin.readLineSync();
  print('Enter student bio: ');
  var bio = stdin.readLineSync();
  print('Enter student school fees: ');
  var fees = stdin.readLineSync();

print(newStudent(
      department: department,
      fullName: name,
      gender: gender,
      age: age,
      phone: phone,
      email: email,
      address: address,
      bio: bio,
      fees: fees));

print(
      'Would you like to register another student?\nEnter Yes or No:');
  var input = stdin.readLineSync();
  if (input == 'yes' || input == 'YES' || input == 'Yes') {
    entry();
  } else if (input == 'no' || input == 'No' || input == 'NO') {
    print('Do have a lovely day!');
  } else {
    print('Error\nEnter Yes or No!');
  }

}
GetStudentInfo newStudent(
    {dynamic department, dynamic fullName, dynamic gender, dynamic age, dynamic phone, dynamic email, dynamic address, dynamic bio, dynamic fees,}) {
  
  GetStudentInfo student = new GetStudentInfo(
      department: department,
      fullName: fullName,
      gender: gender,
      age: age,
      phone: phone,
      email: email,
      address: address,
      bio: bio,
      fees: fees,
      );

  return student;
}
void main() {
  // Easily get a single line.
  welcome();
}