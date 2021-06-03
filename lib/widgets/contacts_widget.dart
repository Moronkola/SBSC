import 'package:contacts_app/screens/contact_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 15),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
// Activity activity = widget.destination.activities[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyDetailPage()),
              );
            },
            child: Stack(
              children: [
                Container(
                  // margin: EdgeInsets.fromLTRB(20, 2, 20, 2),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 20),

// height: 170,
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 35),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    // padding:  EdgeInsets.fromLTRB(20, 10, 20, 10),
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Activity Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 9,
                  // bottom: 5,
                  left: 23,
                  // Align(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image(
                      height: 45,
                      width: 45,
                      image: AssetImage(
                        'assets/images/murano.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // alignment: Alignment.centerLeft,
                  // ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
