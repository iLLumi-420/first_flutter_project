
import 'package:flutter/material.dart';

class ToDo {
  late String todo;

  ToDo({ required this.todo});

  
}

class ToDoList extends StatefulWidget {
  const ToDoList({ Key? key }) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

//class in this file

class _ToDoListState extends State<ToDoList> {
  List<ToDo> toDoList = [];
  
  final TextEditingController _textFieldController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const  Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.black,),
        backgroundColor: Colors.orange[400],
        onPressed: (){
            _displayDialog(context);
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.orange,
      //   items:  [
          
      //   ],
      //   ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: toDoList.map((toDo) {
          int index = toDoList.indexOf(toDo);
          return _returnCard(toDo, index);
          }).toList() 
        ),
      )
    );
  }

  Widget _returnCard(toDo, index){
    return toDoCard(index, toDo);
  }

  Card toDoCard(index, toDo) {
    return Card(
    color: Colors.orange,

    margin: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Flexible(
                  child: Text('${index + 1} : ${toDo.todo}', style: const TextStyle(
                    fontSize: 20 , 
                    color: Colors.black87
                    ),
                  ),
                ),
                IconButton(onPressed: (){
                  setState(() { toDoList.removeAt(index); });
                }, 
                icon: const Icon(Icons.delete)), 
              ]
          ),
        ),
      ],
    ),
  );
  }

  

  Future _displayDialog(BuildContext context) async {
    return showDialog(
                context: context, 
                builder: (BuildContext context){
                return AlertDialog(
                title: const Text('Add a task'),
                content: TextField(
                  controller: _textFieldController,
                  decoration: const InputDecoration(hintText: 'Enter task here'),
                ),
                actions: [
                  TextButton(
                    onPressed: (){
                    Navigator.of(context).pop();
                    setState(() {
                      toDoList.add(ToDo(todo: _textFieldController.text));
                    });
                    // _textFieldController.clear();
                  },
                   child:const Text('Add'),
                  ),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: const Text('Cancel'))
                ],
              );
            });
  }
}
