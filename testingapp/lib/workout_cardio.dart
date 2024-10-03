import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
//import 'package:testingapp/skill_tracking.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/main.dart';

class ViewCardioWorkoutWidget extends StatefulWidget {
  const ViewCardioWorkoutWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ViewCardioWorkoutWidgetState();
}

class _ViewCardioWorkoutWidgetState extends State<ViewCardioWorkoutWidget> {
  final List<String> exercises = ['TOY SOLDIERS','ALTERNATING HOOKS','UP AND DOWN PLANK','BICYCLE CRUNCHES','BUTT BRIDGE','HEEL TOUCH','SPIDERMAN PLANK','FROG PRESS','BACKWARD LUNGE','FROGGY GLUTE LIFTS','MOUNTAIN CLIMBER','ALTERNATING HOOKS','UP AND DOWN PLANK','BICYCLE CRUNCHES','BUTT BRIDGE','HEEL TOUCH','INCHWORMS','FROG PRESS','BACKWARD LUNGE','FROGGY GLUTE LIFTS','PLANK',"CHILD'S POSE"];
  final List<String> reps = ['00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30','00:30'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardio'),
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