import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/GoalTrack.dart';
import 'package:testingapp/Goals.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/main.dart';
import 'package:testingapp/WorkoutTrack.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


class GoalTrackListWidget extends StatefulWidget {
  final Goal goalvalues;//if you have multiple values add here
  GoalTrackListWidget(this.goalvalues, {Key? key}): super(key: key);
  @override
  State<StatefulWidget> createState() => _GoalTrackListWidgetState();
}

class _GoalTrackListWidgetState extends State<GoalTrackListWidget> {  

  
  final _formKey = GlobalKey<FormState>();
  final _valueController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String  formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
  final _goalTracks = <GoalTrack> [];
  bool achieved=false;
  //double? Goal=widget.goalvalue;

void _deleteTrack(int idx) async{
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
      _goalTracks.removeAt(idx);
      setState(() {});
    }
  }

 Widget _buildStatsList() {
   return Column(
     children: <Widget>[
       const SizedBox(height: 15),
       Flexible( 
           child: SizedBox(height: 20,
              child:  Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [  
                          Text(' Your Goal: ',
                            style: TextStyle(color: Colors.red.shade900,
                            fontSize: 20,),textAlign: TextAlign.center,
                          ),
                          Text (widget.goalvalues.value.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red.shade900,
                            fontSize:20 ),              
                          ),
                          Text(' Your Deadline: ',
                            style: TextStyle(color: Colors.red.shade900,
                            fontSize: 20,),textAlign: TextAlign.center,
                          ),
                          Text (widget.goalvalues.date.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red.shade900,
                            fontSize:20 ),              
                          ),
                         ]
                        ),
                        
         ),
         ),
        const SizedBox(height: 10),
        Flexible(
          child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    margin: EdgeInsets.all(10),
                      series: <ChartSeries>[
                            // Initialize line series
                        LineSeries<GoalTrack, String>(
                          dataSource: [
                            for(int i=0;i<_goalTracks.length;i++) 
                              _goalTracks[i]                                  
                              ],
                              xValueMapper: (GoalTrack data, _) => data.TrackDate,
                              yValueMapper: (GoalTrack data, _) => data.TrackValue
                            )
                        ]
                  ),
       ),
      Expanded(
        child:ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: _goalTracks.length, //posa stoixeia tha exei h lista
          separatorBuilder: (context,index) => const Divider(), //eidos diaxwristikou
          itemBuilder: (context, index) {
            IconData iconData;
            String toolTip;
            TextDecoration txtDec; 
            return 
             Column(
              children: <Widget>[
              //if (_goalTracks[index].TrackValue>= widget.goalvalue)
                //_achieved(),
                /*Expanded(child:
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 20,
                    child: Text('You have reached your goal Congrats You over achiever!',
                    style: TextStyle(color: Colors.red.shade900,fontSize: 16)
                    )
                  ), 
                ), */
                const SizedBox(height: 8),              
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(8),
                  height: 90,
                  child:ListTile(
                    title:  Text('Track:',
                    style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold) ),
                    subtitle: Column(
                      children: <Widget>[
                        const SizedBox(height: 8),
                        Row( children: [
                          Text('Date:',
                            style: TextStyle(color: Colors.black,),
                          ),
                          Text (_goalTracks[index].TrackDate,
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black,),                  
                          ),
                         ]
                        ),
                        const SizedBox(height: 8),
                          Row( children: [
                            Text('Value:',
                              style: TextStyle(color: Colors.black,),) ,
                            Text (_goalTracks[index].TrackValue.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black,), 
                              ),                   
                            ],
                          ),     
                          ]),
                   trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {_deleteTrack(index);
                    },
                    tooltip: 'Delete Entry'
                    ), 
                  ),
            decoration: BoxDecoration(
                color: Colors.red.shade200,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              ),                
            ]
          );       
          }
    )
      ),
     ]
   );
   
  }
  void _addNewGoalTrack() async{
    final GoalTrackEntry _newTrackEntry = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => GoalTrackWidget()));
    if (_newTrackEntry!= null) {
      //Add new goal
        _goalTracks.add(GoalTrack(
        TrackValue: _newTrackEntry.TrackValueEntry,
        TrackDate: _newTrackEntry.TrackDateEntry,
      ));
      setState(() {});
    }
  }  
  @override
  void dispose() {
    _valueController.dispose();
    _dateController.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Goals'),
        centerTitle:  true,
        backgroundColor: Colors.red.shade900
      ),
      body: _buildStatsList(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => StartPageWidget()));*/}, icon: const Icon(Icons.house),tooltip: 'Home Page'),
            IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutSplitWidget()));*/}, icon: const Icon(Icons.perm_contact_calendar),tooltip: 'Workout Split'),
            IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkillTrackingWidget()));*/},   icon: const Icon(Icons.trending_up),tooltip: 'Skill Tracking'),
            IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutWidget()));*/},   icon: const Icon(Icons.fitness_center),tooltip: 'Workouts'),
          ],
        ),
        color: Colors.red.shade900
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addNewGoalTrack,
        backgroundColor: Colors.red.shade900,
        tooltip: 'Add Goal',
      ),
    );;
  }
}

class GoalTrack {
  double TrackValue;
  String TrackDate;
  GoalTrack({required this.TrackValue, required this.TrackDate});
}

