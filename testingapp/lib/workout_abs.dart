import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
//import 'package:testingapp/skill_tracking.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/main.dart';

class ViewABWorkoutWidget extends StatefulWidget {
  const ViewABWorkoutWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ViewABWorkoutWidgetState();
}

class _ViewABWorkoutWidgetState extends State<ViewABWorkoutWidget> {
  final List<String> exercises = ['JUMPING JACKS','HEEL TOUCH','CROSSOVER CRUNCH','MOUNTAIN CLIMBER','SIDE BRIDGES RIGHT','BUTT BRIDGE','BICYCLE CRUNCHES','V-UP','HEEL TOUCH','ABDOMINAL CRUNCHES','PLANK','CROSSOVER CRUNCH','LEG RAISES','BICYCLE CRUNCHES','PUS-UP & ROTATION','SIDE PLANK LEFT','SIDE PLANK RIGHT', 'COBRA STRETCH', 'SPINE LUMBAR TWIST STRETCH LEFT','SPINE LUMBAR TWIST STRETCH RIGHT' ];
  final List<String> reps = ['00:30','x26','x20','x20','x12','x12','x20','x20','x20','x26','x20','00:30','x20','x16','20','x20','00:20','00:20','00:30','00:30','00:30'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AB Workout'),
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