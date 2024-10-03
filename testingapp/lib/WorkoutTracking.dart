import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/Goals.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
import 'package:testingapp/mainPage.dart';
//import 'package:testingapp/skill_tracking.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/main.dart';
import 'package:testingapp/WorkoutTrack.dart';


class WorkoutTrackingWidget extends StatefulWidget {
  const WorkoutTrackingWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _WorkoutTrackingWidgetState();
}

class _WorkoutTrackingWidgetState extends State<WorkoutTrackingWidget> {
  final List<String> exercises = ['JUMPING JACKS','HEEL TOUCH','CROSSOVER CRUNCH','MOUNTAIN CLIMBER','SIDE BRIDGES RIGHT','BUTT BRIDGE' ];
  final List<String> reps = ['00:30','3x20','3x20','3x20','3x12','3x12'];
  var isChecked = List.filled(6, false, growable: true);
  //Bool  List<Bool> isChecked = false;
  Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.red.shade900;
    }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todays Workout'),
        centerTitle:  true,
        backgroundColor: Colors.red.shade900
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
              IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPageWidget()));}, icon: const Icon(Icons.home),tooltip: 'Home Page'),
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutSplitWidget()));}, icon: const Icon(Icons.calendar_today),tooltip: 'Workout Split'),
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatisticsWidget()));},   icon: const Icon(Icons.trending_up),tooltip: 'Set Goals'),
            IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutWidget()));},   icon: const Icon(Icons.fitness_center),tooltip: 'Workouts'),
                  ]        ),
        color: Colors.red.shade900
      ),
      body: ListView.separated(
        itemCount: exercises.length,
        separatorBuilder: (context,index) => const Divider(),
        itemBuilder: (context,index) {
          return ListTile( 
            title: FittedBox(
                      fit: BoxFit.fill,
                        child: Row(
                        children: <Widget>[
                          SizedBox(
                            width:100,
                            height: 15,
                            child: Text(exercises[index],
                            style: TextStyle(fontSize: 11)
                            ), 
                          ),
                          SizedBox(
                            width:100,
                            height:15,
                            child: Text(reps[index],
                            style: TextStyle(fontSize: 11)
                            ),                             
                            ), 
                        ]
                        ),
            ),         
            trailing: FittedBox(
                      fit: BoxFit.fill,
                        child: Row(
                        children: <Widget>[
                          SizedBox(
                            width:100,
                            child: Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isChecked[index],
                              onChanged: (bool? value) {
                                setState(() {
                                isChecked[index] = value!;
                                });
                             },
                            ),
                          ),
                            SizedBox( 
                              width: 100,
                              child:ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => TrackListWidget()));}, child: Text('+Add'), style: ElevatedButton.styleFrom(primary: Colors.red.shade900,onPrimary: Colors.white)),
                        ),
                        ]
            ),
            ),
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