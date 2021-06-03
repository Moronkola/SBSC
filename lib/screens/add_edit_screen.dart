import 'dart:io';
import 'package:contacts_app/constants/themes.dart';
import 'package:contacts_app/widgets/bottomsheet.dart';
import 'package:contacts_app/widgets/gender_widget.dart';
import 'package:contacts_app/widgets/reusable_textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../db.dart';
import '../model.dart';
import '../model.dart';
//import 'package:image_picker/image_picker.dart';

class AddEditContact extends StatefulWidget {
  const AddEditContact({Key key}) : super(key: key);

  @override
  _AddEditContactState createState() => _AddEditContactState();
}

class _AddEditContactState extends State<AddEditContact> {
  int _value = 0;
  PickedFile _imageFile;
  bool _filled = false;

  int radFemVal = 1;
  int radMaleVal = 2;

  String male = 'Male';
  String female = 'Female';

  void onChanges(val) {
    setState(() {
      _filled = true;
    });
  }

  TextEditingController _firstName;
  TextEditingController _lastName;
  TextEditingController _phone;
  TextEditingController _email;
  TextEditingController _address;
  String _gender = '';
  bool _selected = false; 

  @override
  void dispose() {
    DatabaseService.instance.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20, top: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.0),
                  splashColor: Colors.grey,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_outlined),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: _imageFile == null
                          ? AssetImage("assets/images/murano.jpg")
                          : FileImage(File(_imageFile.path)),
                      backgroundColor: Theme.of(context).accentColor,
                    ),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white, width: 3),
                            color: Colors.teal,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GenderWidget(
                        radVal: radMaleVal,
                        value: _value,
                        gender: male,
                        onChange: (value) {
                          setState(() {
                            _value = value;
                            _gender = male;
                          });
                        },
                      ),
                      GenderWidget(
                        radVal: radFemVal,
                        value: _value,
                        gender: female,
                        onChange: (value) {
                          setState(() {
                            _value = value;
                            _gender = female;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: ReusableTextField(
                          textController: _firstName,
                          label: 'Firstname',
                          icon: Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                          onChange: onChanges,
                          filled: _filled,
                        ),
                      ),
                      Flexible(
                        child: ReusableTextField(
                          textController: _lastName,
                          label: 'Lastname',
                          icon: Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                          onChange: onChanges,
                          filled: _filled,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ReusableTextField(
                    textController: _phone,
                    label: 'Phone',
                    icon: Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    onChange: onChanges,
                    filled: _filled,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ReusableTextField(
                    textController: _email,
                    label: 'Email Address',
                    icon: Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                    onChange: onChanges,
                    filled: _filled,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ReusableTextField(
                    textController: _address,
                    label: 'Address',
                    icon: Icon(
                      Icons.home,
                      color: Colors.black54,
                    ),
                    onChange: onChanges,
                    filled: _filled,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: buttonWidget(
                        buttonAction: () async {
                          final contact = Contact(firstName: _firstName.text, lastName: _lastName.text, phone: _phone.text, email: _email.text, address: _address.text, gender: _gender, selected: _selected,);
                        await DatabaseService.instance.insert(contact);
                        Navigator.pop(context);
                        },
                        buttonColor: Colors.black,
                        buttonText: "Save"),
                  ),
                   
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
