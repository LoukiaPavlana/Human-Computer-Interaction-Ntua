import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/GoalTrack.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/main.dart';
import 'package:testingapp/WorkoutTrack.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:flutter/services.dart';


class CreateWorkoutWidget extends StatefulWidget {
  const CreateWorkoutWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CreateWorkoutWidgetState();
}

class _CreateWorkoutWidgetState extends State<CreateWorkoutWidget> {  
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _TitleController = TextEditingController();
  final _WorkoutTitleController = TextEditingController();
  final _CategoryController = TextEditingController();
  final _WorkoutCategoryController = TextEditingController();
  final _SetsController = TextEditingController();
  final _RepsController = TextEditingController();
  final _TimeController = TextEditingController();
  final _RestController = TextEditingController();
  final _exercises = <WorkoutExercise> [];
  var categories = ['Upper Body' , 'Lower Body', 'Push', 'Pull','Cardio','Run',];
  String? _currentSelectedValue;
  String _category='strength';
  //final WorkoutEntry? entry=;

void _deleteExercise(int idx) async{
    bool? _delExercise = await showDialog<bool>(
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
    if (_delExercise!) {
      _exercises.removeAt(idx);
      setState(() {});
    }
}
   void _CancelButton () async{
    bool? _cancel = await showDialog<bool>(
      context: context, //otan metaveneis apo ena widget se ena allo gia na swseis mia katastasi
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Are you sure you want to Cancel this entry? Your data wont be saved'),
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
    if (_cancel!) {
      Navigator.pop(context,true);
      return;
    }   
}
 
  void _addNewExercise() async{
   WorkoutExercise? _exercise = await showDialog<WorkoutExercise>(
      context: context,
      builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        title: Text('Exercise'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey2,
              child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(borderSide: BorderSide())
                  ),
                  controller: _TitleController,
                  validator: (value)  {
                  if (value == null || value.isEmpty)
                    return 'Field cannot be empty!';
                    return null;
                  },                  
                  ),
                  const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Sets',
                    border: OutlineInputBorder(borderSide: BorderSide())
                  ),
                  inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],              
                  controller: _SetsController,                
                  ),
                  const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Reps',
                    border: OutlineInputBorder(borderSide: BorderSide())
                  ),
                  controller: _RepsController,
                  inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],                
                  ),
                  const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Duration (Sec)',
                    border: OutlineInputBorder(borderSide: BorderSide())
                  ),
                  controller: _TimeController,
                  inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],                
                  ),
                  const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Rest Between Sets (Sec)',
                    border: OutlineInputBorder(borderSide: BorderSide())
                  ),
                  controller: _RestController,
                  inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],
                  ),              
                ],
                        ),
                      ),
                    ),
        actions:<Widget> [
          RaisedButton(
                  child: Text("Cancel"),
                   onPressed: () {
                        Navigator.pop(context)
                      },)
                      RaisedButton(
                  child: Text("OK"),
                   onPressed: () {
                        if (_formKey2.currentState!.validate()){
                          final entry = WorkoutExercise(
                            Extitle: _TitleController.text,
                            Excategory: _CategoryController.text,
                            Exsets: _SetsController.text,
                            Exreps: _RepsController.text,
                            Extime: _TimeController.text,
                            Exrestbetweensets: _RestController.text,                      
                            )
                          Navigator.pop(context,entry);
                      }

                   }
                      )
                    ],
                  );
                });
    if (_exercise!= null) {
      //Add new goal
        _exercises.add(WorkoutExercise(
          Extitle: _TitleController.text,
          Excategory: _CategoryController.text,
          Exsets: _SetsController.text,
          Exreps: _RepsController.text,
          Extime: _TimeController.text,
          Exrestbetweensets: _RestController.text,
          )
          
          );
        setState(() {});
        _CategoryController.clear();
        _TitleController.clear();
        _RestController.clear();
        _TimeController.clear();
        _SetsController.clear();
        _RepsController.clear();
    }
  }

 Widget _buildExercisesList() {
    return Column(
      children: <Widget> [
        const SizedBox(height: 8),
        Form(
          key: _formKey,
          child: Column(
             children: <Widget>[ 
          
        Padding(padding:
                  EdgeInsets.all(8.0),
                  child:
        Flexible(child:
        TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(borderSide: BorderSide())
                  ),
                  controller: _WorkoutTitleController,
                  validator: (value)  {
                  if (value == null || value.isEmpty)
                    return 'Title cannot be empty!';
                    return null;
                  },                  
                  ),
        ),
        ),
         Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new TextFormField(
                          controller: _WorkoutCategoryController,
                          decoration: const InputDecoration(
                          hintText: 'Category',
                          border: OutlineInputBorder(borderSide: BorderSide())
                          ),
                          validator: (value)  {
                            if (value == null || value.isEmpty)
                            return 'Title cannot be empty!';
                            return null;
                          })
                          ),
                          new PopupMenuButton<String>(
                            icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                          _WorkoutCategoryController.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return categories.map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(child: new Text(value), value: value);
                          }).toList();
                        },
                      ),
                    ],
                  ),
                ),
             ],   
          ),
        ),     
                Expanded(
      //fit: FlexFit.loose,
      child:ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _exercises.length, //posa stoixeia tha exei h lista
      separatorBuilder: (context,index) => const Divider(), //eidos diaxwristikou
      itemBuilder: (context, index) {
        IconData iconData;
        String toolTip;
        TextDecoration txtDec; 
        return 
          Column(
            children: <Widget>[
              const SizedBox(height: 8),
               Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            height: 130,
            child:ListTile(
            title:  Text(_exercises[index].Extitle,
            style: TextStyle(color: Colors.black, fontSize: 20.0,fontWeight: FontWeight.bold) ),
            subtitle: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                Row( children: [
                  Text('Sets:',
                    style: TextStyle(color: Colors.black,),
                  ),
                  Text (_exercises[index].Exsets.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,),                  
                  ),
                ]
                ),
                const SizedBox(height: 8),
                Row( children: [
                  Text('Reps:',
                    style: TextStyle(color: Colors.black,),) ,
                  Text (_exercises[index].Exreps.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,), 
                  ),                   
                ],
                ),
                const SizedBox(height: 8),
                Row( children: [
                  Text('Time:',
                    style: TextStyle(color: Colors.black,),) ,
                  Text (_exercises[index].Extime.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,), 
                  ),                   
                ],
                ),
                const SizedBox(height: 8),
                Row( children: [
                  Text('Rest Between sets:',
                    style: TextStyle(color: Colors.black,),) ,
                  Text (_exercises[index].Exrestbetweensets.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black,), 
                  ),                   
                ],
                ),  
                
                ]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {_deleteExercise(index);
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
    ),
    ),
      const SizedBox(height: 8),
      Align(
        alignment: Alignment.bottomCenter,
      child: ElevatedButton (
          child: Text('Done'),style: ElevatedButton.styleFrom(
                  primary:Colors.red.shade900, textStyle: TextStyle(color: Colors.white,)),
          onPressed: () {
                        if (_formKey.currentState!.validate()){
                          final entry = WorkoutEntry(
                            WorkoutTitle: _WorkoutTitleController.text,
                            WorkoutCategory: _WorkoutCategoryController.text,                    
                          );
                          Navigator.pop(context,entry);
                        }
                        }
                      ,)
      ),
      ]
    );
  } 
  @override
  void dispose() {
    _TitleController.dispose();
    _RepsController.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Workout'),
        centerTitle:  true,
        backgroundColor: Colors.red.shade900
      ),
      body: _buildExercisesList(),
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
        onPressed: _addNewExercise,
        backgroundColor: Colors.red.shade900,
        tooltip: 'Add Exercise',
      ),
    );;
  }
}

class WorkoutEntry {
  String WorkoutTitle;
  String WorkoutCategory;
  WorkoutEntry({required this.WorkoutTitle ,required this.WorkoutCategory});
}

class WorkoutExercise {
  String Extitle;
  String Excategory;
  String? Exsets;
  String? Exreps; 
  String? Extime;
  String? Exrestbetweensets;
  WorkoutExercise({required this.Extitle ,required this.Excategory, this.Exsets, required this.Exreps, this.Extime,this.Exrestbetweensets});
}
