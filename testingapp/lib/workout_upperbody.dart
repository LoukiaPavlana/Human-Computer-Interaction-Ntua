import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
//import 'package:testingapps/skill_tracking.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/main.dart';

class ViewUpperWorkoutWidget extends StatefulWidget {
  const ViewUpperWorkoutWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ViewUpperWorkoutWidgetState();
}

class _ViewUpperWorkoutWidgetState extends State<ViewUpperWorkoutWidget> {
  final List<String> exercises = ['ARM RAISES','SIDE ARM RAISE','TRICEPS DIPS','ARM CIRCLES CLOCKWISE','ARM CIRCLES COUNTERCLOCKWISE','DIAMON PUSH-UPS','JUMPING JACKS','CHEST PRESS PULSE','LEG BARBELL CURL LEFT','LEG BARBELL CURL RIGHT','DIAGONAL PLANK','PUNCHES','PUSH-UPS','INCHWORMS','WALL PUSH-UPS','TRICEPS STRETCH LEFT','TRICEPS STRETCH RIGHT','STANDING BICEPS STRETCH LEFT','STANDING BICEPS STRETCH RIGHT'];
  final List<String> reps = ['00:30','00:30','x10','00:30','00:30','x6','00:30','00:16','x8','x8','x10','00:30','x10','x8','x12','00:30','00:30','00:30','00:30'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upperbody Workout'),
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