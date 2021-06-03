import 'package:contacts_app/constants/themes.dart';
import 'package:contacts_app/widgets/subheading_widget.dart';
import 'package:flutter/material.dart';

import '../db.dart';
import '../model.dart';
import 'add_edit_screen.dart';

class MyDetailPage extends StatefulWidget {
  MyDetailPage({Key key}) : super(key: key);

  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
//Contact contact = Contact ();
bool check = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xFFF3F5F7),
        floatingActionButton: FloatingActionButton(
            elevation: 14,
            backgroundColor: Colors.black,
            foregroundColor: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            tooltip: 'Edit Todo',
            child: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddEditContact()),
              );
            }),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(50.0),
                splashColor: Colors.grey,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_outlined),
              ),

              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          // Colors.pink,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 130,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Simi Pam',
                          style: heading1,
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () async {
                            setState(() {                            
                            check =! check;
                            //contact.toggleSelected();
                            });
//                            await DatabaseService.instance.update(contact);
                          },
                            child: Icon(
                            //contact.selected ? Icons.star: Icons.star_outline,
                            check ? Icons.star: Icons.star_outline,
                            color: Colors.yellow,
                          ),
                        )

                      ]
                        )
                      
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Expanded(
                child: Container(
                  // margin: EdgeInsets.symmetric(vertical: 2, horizontal: 20),

// height: 170,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Phone',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text('08038608713', style: heading1),
                          Spacer(),
                          Icon(
                            Icons.phone,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 260,
                            child: Text(
                              'pam@yahoo.com',
                              style: heading1,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.mail,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      // SizedBox(height: 15),
                      Text(
                        'Gender',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Female',
                            style: heading1,
                          ),
                          Spacer(),
                          Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Address',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            width: 260,
                            child: Text(
                              '17, Akinrinlo Street, Ikeja, Lagos, Nigeria.',
                              style: heading1,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.location_on,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 60,
              ),
              // Spacer(),
            ],
          ),
        ),
      );
}
