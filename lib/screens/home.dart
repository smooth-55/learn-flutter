import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo/components/modal.dart';
import 'package:todo/screens/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var obj = <Map<String, dynamic>>[
  {"id": 1, "title": "Task 1", "desc": "desc 1", "status": false},
  {"id": 2, "title": "Task 2", "desc": "desc 2", "status": false},
  {"id": 3, "title": "Task 3", "desc": "desc 3", "status": false}
];

class _HomePageState extends State<HomePage> {
  List data = [];
  final dio = Dio();

  Future<void> fetchTodos() async {
    try {
      final response = await dio.get('http://localhost:8000/users/todos');
      if (response.statusCode == 200) {
        print(response.data["data"]);

        setState(() {
          data = response.data["data"];
        });
        //
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    void toggleCheckBox(int indx) {
      setState(() {
        data[indx]["status"] = !obj[indx]["status"];
      });
      print(obj);
    }

    final titleController = TextEditingController();
    final descController = TextEditingController();

    // fetchTodos();
    return Scaffold(
      backgroundColor: Colors.lime,
      appBar: AppBar(
        elevation: 0,
        title: Text("Todo"),
      ),
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return TodoTile(
                    id: obj[index]["id"],
                    title: obj[index]["title"],
                    status: obj[index]["status"],
                    desc: obj[index]["desc"],
                    onChanged: (v) => toggleCheckBox(index));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTodoDialog(context, titleController, descController,
            obj, obj[obj.length - 1]["id"]),
        child: Icon(Icons.add),
      ),
    );
  }
}
