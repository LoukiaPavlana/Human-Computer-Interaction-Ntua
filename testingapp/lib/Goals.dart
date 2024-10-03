import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testingapp/createWorkouts.dart';
import 'package:testingapp/Create_Split.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/Goals.dart';
import 'package:testingapp/MealTracking.dart';
import 'package:testingapp/SetGoal.dart';
import 'package:testingapp/GoalTrack.dart';
import 'package:testingapp/GoalTrackList.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
import 'package:testingapp/workouts.dart';

import 'package:testingapp/MainPage.dart';
import 'package:testingapp/chart_container.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';



class StatisticsWidget extends StatefulWidget{
  const StatisticsWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _StatisticsState();
}

class _StatisticsState extends State<StatisticsWidget>{  // This widget is the root of your application.
final _goals = <Goal> [];
final _goalTracks = <GoalTrack> [];
double? GoalValue=null; 


  Widget _choose(){
    if(_goalTracks.length == 0)
      return _buildGoalList();
    else
    return  _buildStatsList();
  }

 Widget _buildStatsList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _goals.length, //posa stoixeia tha exei h lista
      separatorBuilder: (context,index) => const Divider(), //eidos diaxwristikou
      itemBuilder: (context, index) {
        IconData iconData;
        String toolTip;
        TextDecoration txtDec; 
        return 
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            height: 150,
            child:ListTile(
            title:  Text(_goals[index].title,
            style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold) ),
            subtitle: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                Row( children: [
                  Text('Category:',
                    style: TextStyle(color: Colors.black,),
                  ),
                  Text (_goals[index].category,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,),                  
                  ),
                ]
                ),
                const SizedBox(height: 8),
                Row( children: [
                  Text('Value:',
                    style: TextStyle(color: Colors.black,),) ,
                  Text (_goals[index].value.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,), 
                  ),                   
                ],
                ),
                const SizedBox(height: 8),
                Row( children: [
                  Text('Deadline:',
                    style: TextStyle(color: Colors.black,),) ,
                  Text (_goals[index].date,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,), 
                  ),                   
                ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                    child:ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>GoalTrackWidget()));}, child: Text('+Track'), style: ElevatedButton.styleFrom(primary: Colors.red.shade900,onPrimary: Colors.white)),
                ),
                const SizedBox(height: 8),
                ]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {_deleteGoal(index);
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

  void _deleteGoal(int idx) async{
    bool? _delGoal = await showDialog<bool>(
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
    if (_delGoal!) {
      _goals.removeAt(idx);
      setState(() {});
    }
  }
  void _addNewGoal() async{
    final GoalEntry _newEntry = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SetGoalWidget()));
    if (_newEntry!= null) {
      //Add new goal
        _goals.add(Goal(
        title: _newEntry.titleEntry,
        value: _newEntry.valueEntry,
        category: _newEntry.categoryEntry,
        date: _newEntry.DateEntry,
      ));
      setState(() {});
    }
  }
  Widget _buildGoalList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _goals.length, //posa stoixeia tha exei h lista
      separatorBuilder: (context,index) => const Divider(), //eidos diaxwristikou
      itemBuilder: (context, index) {
        IconData iconData;
        String toolTip;
        TextDecoration txtDec;
        return 
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            height: 150,
            child:ListTile(
            title:  Text(_goals[index].title,
            style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold) ),
            subtitle: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                Row( children: [
                  Text('Category:',
                    style: TextStyle(color: Colors.black,),
                  ),
                  Text (_goals[index].category,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,),                  
                  ),
                ]
                ),
                const SizedBox(height: 8),
                Row( children: [
                  Text('Value:',
                    style: TextStyle(color: Colors.black,),) ,
                  Text (_goals[index].value.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,), 
                  ),                   
                ],
                ),
                const SizedBox(height: 8),
                Row( children: [
                  Text('Deadline:',
                    style: TextStyle(color: Colors.black,),) ,
                  Text (_goals[index].date,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,), 
                  ),                   
                ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                    child:ElevatedButton(
                      onPressed: () {
                        double? GoalValue=_goals[index].value;
                        String? GoalDate=_goals[index].date;                     
                        /*Navigator.of(context).push(MaterialPageRoute(builder: (context,_goals[index].value) => GoalTrackListWidget()));}*/
                       Navigator.push(context,MaterialPageRoute(builder: (context) => GoalTrackListWidget(_goals[index])));},                     
                      child: Text('+Track'), style: ElevatedButton.styleFrom(primary: Colors.red.shade900,onPrimary: Colors.white)),
                ),
                const SizedBox(height: 8),   
                ]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {_deleteGoal(index);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Goals'),
        centerTitle:  true,
        backgroundColor: Colors.red.shade900
      ),
      body: _choose(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPageWidget()));}, icon: const Icon(Icons.house),tooltip: 'Home Page'),
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutSplitWidget()));}, icon: const Icon(Icons.perm_contact_calendar),tooltip: 'Workout Split'),
            IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkillTrackingWidget()));*/},   icon: const Icon(Icons.trending_up,color: Colors.white),tooltip: 'Set Goals'),
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutWidget()));},   icon: const Icon(Icons.fitness_center),tooltip: 'Workouts'),
             ],
        ),
        color: Colors.red.shade900
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addNewGoal,
        backgroundColor: Colors.red.shade900,
        tooltip: 'Add Goal',
      ),
    );
  }
}


class Goal {
  String title;
  double value;
  String category;
  String date;
  Goal({required this.title , required this.value, required this.category, required this.date});
}

class GoalTrack {
  double TrackValue;
  String TrackDate;
  //String? discription;
  GoalTrack({required this.TrackValue, required this.TrackDate});
}

