import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

  
  final ImagePicker _picker = ImagePicker();

 void takePhoto(ImageSource source) async {
  final pickedFile = await _picker.getImage(
    source: source,
  );
  
}
Widget bottomSheet() {
  return Container(
    height: 100.0,
    width: double.infinity,
    margin: EdgeInsets.all(20.0),
    child: Column(
      children: [
      Text('Choose a profile photo',
      style: TextStyle(
        fontSize: 20.0,
      )
      ),
      SizedBox(height: 10.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
                primary: Colors.teal,
          ),
          onPressed: () {
            takePhoto(ImageSource.camera);
          }, 
          icon: Icon(Icons.camera), 
          label: Text('Camera')
        ),
        SizedBox(width: 10.0,),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
                primary: Colors.teal,
          ),
          onPressed: () {
            takePhoto(ImageSource.gallery);
          }, 
          icon: Icon(Icons.image), 
          label: Text('Gallery')
        )
      ],)
    ],)
  );
}
