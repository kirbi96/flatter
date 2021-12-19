import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String task = '';
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(['Выучит флаттер', 'Выучить реакт натив', 'Выучить свифт']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список дел'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(
                      title: Text(todoList[index]),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.deepOrangeAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          todoList.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    todoList.removeAt(index);
                  });
                },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
            title: const Text('Добавить задачу'),
              content: TextField(
                onChanged: (String value){
                  task = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    todoList.add(task);
                  });
                  Navigator.of(context).pop();
                }, child: const Text('Добавить'))
              ],
            );
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black54,
        ),
      ),
    );
  }
}
