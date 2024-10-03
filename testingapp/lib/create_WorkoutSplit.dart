import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testingapp/Create_Split.dart';
import 'package:testingapp/MainPage.dart';
import 'package:testingapp/Goals.dart';
import 'package:testingapp/workouts.dart';




class WorkoutSplitWidget extends StatefulWidget {
  const WorkoutSplitWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WorkoutSplitWidgetState();
}

class _WorkoutSplitWidgetState extends State<WorkoutSplitWidget> {
  final _tasks = <Task> [];

  void _deleteTask(int idx) async{
    bool? _delTask = await showDialog<bool>(
      context: context, //otan metaveneis apo ena widget se ena allo gia na swseis mia katastasi
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Are you sure you want to Delete this Split?'),
        actions: <Widget> [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context,false),
            ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () => Navigator.pop(context,true),
          )
        ],
      ) 
    );
    if (_delTask!) {
      _tasks.removeAt(idx);
      setState(() {});
    }
  }
  void _addNewEntry() async{
    final Entry _newEntry = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ViewEditSplitWidget()));
    if (_newEntry != null) {
      //Add the new task
      _tasks.add(Task(
        title: _newEntry.title,
        //descripion: _newEntry.description,
      ));
      //Redraw the widget
      setState(() {});
    }
  }

  Widget _buildTaskList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _tasks.length, //posa stoixeia tha exei h lista
      separatorBuilder: (context,index) => const Divider(), //eidos diaxwristikou
      itemBuilder: (context, index) {
        IconData iconData;
        String toolTip;
        TextDecoration txtDec;

        if (_tasks[index].completed) {
          iconData = Icons.check_box_outlined;
          toolTip = 'Mark as uncompleted';
          txtDec = TextDecoration.lineThrough;
        } else {
          iconData = Icons.check_box_outline_blank_outlined;
          toolTip = 'Mark as completed';
          txtDec = TextDecoration.none;
        }
        return ListTile(
          leading: IconButton(
            icon: Icon(iconData),
            onPressed: () {
              _tasks[index].completed = !_tasks[index].completed; //pressing the button changes to completed/uncompleted
              setState(() {});
            },
            tooltip: toolTip,
            ),
            title: Text(_tasks[index].title, style: TextStyle(decoration: txtDec)),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {_deleteTask(index);
              },
              tooltip: 'Delete split'
            ),
        );
      }, //kaleis kathe stoixeio ksexwrista
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Splits'),
        centerTitle:  true,
        backgroundColor: Colors.red.shade900
      ),
      body: _buildTaskList(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPageWidget()));}, icon: const Icon(Icons.home),tooltip: 'Home Page'),
            IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutSplitWidget()));*/}, icon: const Icon(Icons.calendar_today,color: Colors.white),tooltip: 'Workout Split'),
            IconButton(onPressed: () { Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatisticsWidget()));},   icon: const Icon(Icons.trending_up),tooltip: 'Set Goals'),
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutWidget()));},   icon: const Icon(Icons.fitness_center),tooltip: 'Workouts'), ],
        ),
        color: Colors.red.shade900
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addNewEntry,
        backgroundColor: Colors.red.shade900,
        tooltip: 'Add Split',
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class Task {
  String title;
  //String? description;
  bool completed = false;
  Task({required this.title /*,this.description*/});
}