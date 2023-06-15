import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../providers/todo_proider.dart';


class TodoAction extends StatelessWidget {
   TodoAction({Key? key}) : super(key: key);
  bool _isSelected = true;
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context);
    return ListView.builder(
      itemCount: task.allTasks.length,
      itemBuilder: ((context, index) => Slidable(
        startActionPane: ActionPane(motion: BehindMotion(), children: [
          SlidableAction(onPressed: (context){
            task.deleteTask(task.allTasks[index]);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Show Snackbar'),
              duration: Duration(seconds: 3),
            ));
          },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: "Delete",
          ),
        ]),
        child: ListTile(
          leading: Checkbox(
            value: task.allTasks[index].completed,
            onChanged: ((_) => task.toggleTask(task.allTasks[index])),
          ),
          title: Text(task.allTasks[index].todoTitle,style: TextStyle(
              decoration: !_isSelected ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.bold,
          ),),
          // trailing: IconButton(
          //     onPressed: () {
          //       task.deleteTask(task.allTasks[index]);
          //     },
          //     icon: const Icon(Icons.delete)),
        ),
      )),
    );
  }
}
