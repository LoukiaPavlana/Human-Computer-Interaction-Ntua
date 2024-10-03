import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
//import 'package:testingapp/skill_tracking.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/main.dart';

class ViewLowerWorkoutWidget extends StatefulWidget {
  const ViewLowerWorkoutWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ViewLowerWorkoutWidgetState();
}

class _ViewLowerWorkoutWidgetState extends State<ViewLowerWorkoutWidget> {
  final List<String> exercises = ['SIDE HOP','SQUATS','SQUATS','SIDE-LYING LEG LIFT LEFT','SIDE-LYING LEFT LIFT RIGHT','SIDE-LYING LEG LIFT LEFT','SIDE-LYING LEFT LIFT RIGHT','BACKWARD LUNGE','BACKWARD LUNGE','DONKEY KICKS LEFT','DONKEY KICKS RIGHT','DONKEY KICKS LEFT','DONKEY KICK RIGHT','LEFT QUAT STRETCH WITH WALL','RIGHT QUAD STRETCH WITH WALL','KNEE TO CHEST STRETCH LEFT','KNEE TO CHEST STRETCH RIGHT','WALL CALF RAISES','WALL CALF RAISES','SUMO SQUAT CALF RAISES WITH WALL','SUMO SQUAT CALF RAISES WITH WALL','CALF STRETCH LEFT','CALF STRETCH RIGHT'];
  final List<String> reps = ['00:30','x12','x12','x12','x12','x12','x12','x14','x14','x16','x16','x16','x16','00:30','00:30','00:30','00:30','x12','x12','x12','x12','00:30','00:30'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lowerbody Workout'),
        centerTitle:  true,
        backgroundColor: Colors.red.shade900
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => StartPageWidget()));}, icon: const Icon(Icons.house),tooltip: 'Home Page'),
            IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutSplitWidget()));}, icon: const Icon(Icons.perm_contact_calendar),tooltip: 'Workout Split'),
            IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkillTrackingWidget()));*/}, icon: Image.asset('assets/images/progression.png'),tooltip: 'Skill Tracking'),
            IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutWidget()));}, icon: Image.asset('assets/images/dumbell.png'),tooltip: 'Workouts'),
          ],
        ),
        color: Colors.red.shade900
      ),
      body: ListView.separated(
        itemCount: exercises.length,
        separatorBuilder: (context,index) => const Divider(),
        itemBuilder: (context,index) {
          return ListTile( 
            title: Text(exercises[index]),
            trailing: Text(reps[index]),
            );
          }
        )
    );
  }
}

class Exercise {
  String title;
  Exercise({required this.title});
}