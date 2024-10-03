import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/main.dart';
import 'package:testingapp/WorkoutTrack.dart';
import 'package:testingapp/GoalTrackList.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


class GoalTrackWidget extends StatefulWidget {
  const GoalTrackWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _GoalTrackWidgetState();
}

class _GoalTrackWidgetState extends State<GoalTrackWidget> {
  
  final _formKey = GlobalKey<FormState>();
  final _valueController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String  formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
  final _goalTracks = <GoalTrackEntry> [];

 Widget _buildStatsList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _goalTracks.length, //posa stoixeia tha exei h lista
      separatorBuilder: (context,index) => const Divider(), //eidos diaxwristikou
      itemBuilder: (context, index) {
        IconData iconData;
        String toolTip;
        TextDecoration txtDec; 
        return 
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            height: 20,
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
                  Text (_goalTracks[index].TrackDateEntry,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,),                  
                  ),
                ]
                ),
                const SizedBox(height: 8),
                Row( children: [
                  Text('Value:',
                    style: TextStyle(color: Colors.black,),) ,
                  Text (_goalTracks[index].TrackValueEntry.toString(),
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
                SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                            // Initialize line series
                            LineSeries<GoalTrackEntry, String>(
                                dataSource: [  
                                  _goalTracks[index]                                  
                                ],
                                xValueMapper: (GoalTrackEntry data, _) => data.TrackDateEntry,
                                yValueMapper: (GoalTrackEntry data, _) => data.TrackValueEntry
                            )
                        ]
                  )
                ]),
            /*trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {_deleteGoal(index);
              },
              tooltip: 'Delete Entry'
              ), */
          ),
            decoration: BoxDecoration(
              color: Colors.red.shade200,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            );
      }   
    );
  }

/*  void _deleteGoal(int idx) async{
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
 */   
  @override
  void dispose() {
    _valueController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2025),
    
  );
  if (picked != null && picked != selectedDate)
  
    setState(() {
      selectedDate = picked;
      formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      _dateController.text = formattedDate.toString();
    }
    );   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Weights/Reps/Time'),
        backgroundColor: Colors.red.shade900
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
              decoration: const InputDecoration(
                hintText: 'Edit Date',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _dateController,
                onTap: () => _selectDate(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Value',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _valueController,
                validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'Title cannot be empty!';
                  return null;
                },
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget> [
                  const Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel', style: TextStyle(color: Colors.red.shade900)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()){
                          final entry = GoalTrackEntry(
                            TrackValueEntry: double.parse(_valueController.text),
                            TrackDateEntry: formattedDate,                          
                            );
                          Navigator.pop(context,entry);
                        }
                      },
                      child: const Text('Save'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red.shade900)
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GoalTrackEntry {
  double TrackValueEntry;
  String TrackDateEntry;
  GoalTrackEntry({required this.TrackValueEntry, required this.TrackDateEntry});
}

