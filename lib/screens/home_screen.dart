import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_firebase_crud/api/firebase_api.dart';
import 'package:todo_app_firebase_crud/model/todo.dart';
import 'package:todo_app_firebase_crud/provider/todos.dart';
import 'package:todo_app_firebase_crud/widgets/menu_button.dart';
import 'package:todo_app_firebase_crud/widgets/add_todo_dialog_widget.dart';
import 'package:todo_app_firebase_crud/widgets/completed_list_widget.dart';
import 'package:todo_app_firebase_crud/widgets/todo_list_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3e418e),
        elevation: 0,
        leading: MenuButton(),
        title: Text(
          'listly*',
          style: TextStyle(
            color: Color(0xFFfc5e80),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
            
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF3e418e),
        unselectedItemColor: Color(0xff9c9d99),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_outlined, size: 28),
            label: 'Completed', 
          ),
        ],
      ),
     
      body: Column(
        children: [      
          Container(
            padding: EdgeInsets.symmetric(vertical:130),
            decoration: BoxDecoration(                     
              image: DecorationImage(
                fit: BoxFit.fitWidth,                     
                image: AssetImage(
                  "assets/images/todo-list.jpg"                     
                ),
                alignment: Alignment.topLeft
              ),
            ),
          ),  
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF3e418e),
              ),
              child: StreamBuilder<List<Todo>>(
                stream: FirebaseApi.readTodos(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                    default:
                    if (snapshot.hasError) {
                      return buildText('Something Went Wrong Try later');
                    } else {
                          final todos = snapshot.data;

                          final provider = Provider.of<TodosProvider>(context);
                          provider.setTodos(todos);

                          return tabs[selectedIndex];
                    }
                  }
                },
              ),
            ),
          ),
        ]
      ),
      
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    );


