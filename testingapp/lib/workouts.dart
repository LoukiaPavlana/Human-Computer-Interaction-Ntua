import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testingapp/Goals.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
import 'package:testingapp/Create_Split.dart';
import 'package:testingapp/CreateWorkouts.dart';
import 'package:testingapp/MealTracking.dart';
import 'package:testingapp/SetGoal.dart';
import 'package:testingapp/GoalTrack.dart';
import 'package:testingapp/GoalTrackList.dart';
import 'package:testingapp/chart_container.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:testingapp/mainPage.dart';




class WorkoutWidget extends StatefulWidget{
  const WorkoutWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _WorkoutState();
}

class _WorkoutState extends State<WorkoutWidget>{  // This widget is the root of your application.
final _workouts = <Workout> [];

 Widget _buildWorkoutsList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _workouts.length, //posa stoixeia tha exei h lista
      separatorBuilder: (context,index) => const Divider(), //eidos diaxwristikou
      itemBuilder: (context, index) {
        IconData iconData;
        String toolTip;
        TextDecoration txtDec; 
        return 
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            height: 65,
            child:ListTile(
            title:  Text(_workouts[index].title,
            style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold) ),
            subtitle: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                Row( children: [
                  Text('Category:',
                    style: TextStyle(color: Colors.black,),
                  ),
                  Text (_workouts[index].category,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,),                  
                  ),
                ]
                ),
                ]),

            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {_deleteWorkout(index);
              },
              tooltip: 'Delete Entry'
              ),
          ),
            decoration: BoxDecoration(
              color: Colors.red.shade200,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            );
      }   
    );
  }

  void _deleteWorkout(int idx) async{
    bool? _delWorkout = await showDialog<bool>(
      context: context, //otan metaveneis apo ena widget se ena allo gia na swseis mia katastasi
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Are you sure you want to Delete this entry?'),
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
    if (_delWorkout!) {
      _workouts.removeAt(idx);
      setState(() {});
    }
  }
  void _addNewWorkout() async{
    final WorkoutEntry _newEntry = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CreateWorkoutWidget()));
    if (_newEntry!= null) {
      //Add new goal
        _workouts.add(Workout(
        title: _newEntry.WorkoutTitle,
        category: _newEntry.WorkoutCategory,
      ));
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Workouts'),
        centerTitle:  true,
        backgroundColor: Colors.red.shade900
      ),
      body: _buildWorkoutsList(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPageWidget()));}, icon: const Icon(Icons.home),tooltip: 'Home Page'),
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutSplitWidget()));}, icon: const Icon(Icons.calendar_today),tooltip: 'Workout Split'),
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatisticsWidget()));},   icon: const Icon(Icons.trending_up),tooltip: 'Set Goals'),
            IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutWidget()));*/},   icon: const Icon(Icons.fitness_center,color: Colors.white),tooltip: 'Workouts'),
          ],
        ),
        color: Colors.red.shade900
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addNewWorkout,
        backgroundColor: Colors.red.shade900,
        tooltip: 'Add Workout',
      ),
    );
  }
}

class Workout {
  String title;
  String category;
  //double? sets;
  //double? reps; 
  //double? time;
  //double? restbetweensets;
  Workout({required this.title ,required this.category /*, this.sets, required this.reps, this.time,this.restbetweensets*/});
}
