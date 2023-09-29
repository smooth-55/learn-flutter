import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();
void  addTodo(Map<String, String> todo) async{
  final response = await dio.post('http://localhost:8000/users/todos',
    data: todo,
  );
  print('response -->${response.data}');
}

Future<void> addTodoDialog(
    BuildContext context,
    TextEditingController title_controller,
    TextEditingController desc_controller,
    dynamic obj,
    int id) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: const Text('Add todo')),
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          height: 190,
          child: Column(
            children: [
              TextField(
                controller: title_controller,
                decoration: InputDecoration(hintText: "Title"),
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              TextField(
                controller: desc_controller,
                decoration: InputDecoration(hintText: "Description"),
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  var title = title_controller.text;
                  var desc = desc_controller.text;
                  var todo = {
                    "title": title,
                    "description": desc,
                  };
                  print('id ${todo}');
                  if (title.length > 0){
                    addTodo(todo);

                  }


                  // Perform an action when the button is pressed
                },
                child: const Text(
                  'Create todo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
