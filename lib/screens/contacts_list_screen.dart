import 'package:contacts_app/widgets/contacts_widget.dart';
import 'package:contacts_app/widgets/favourites_carousel.dart';
import 'package:contacts_app/widgets/search_widget.dart';
import 'package:contacts_app/widgets/subheading_widget.dart';
import 'package:flutter/material.dart';

import '../constants/String.dart';
import 'add_edit_screen.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.person_add_outlined,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEditContact()),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Contacts",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SearchWidget(searchController: searchController),
              SizedBox(height: 10),
              FavouritesCarousel(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:
                    SubheadingWidget(kFavText: kContactText, kSeeAllText: ""),
              ),
              ContactsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
