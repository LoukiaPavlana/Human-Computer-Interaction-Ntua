import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
//import 'package:testingapp/skill_tracking.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/main.dart';



class WaterSettingsWidget extends StatefulWidget {
  const WaterSettingsWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _WaterSettingsWidgetState();
}

class _WaterSettingsWidgetState extends State<WaterSettingsWidget> {
  bool _value = false;
  double _currentValue = 0.5;
  TimeOfDay? _alarmStart;
  TimeOfDay? _alarmEnd;
  bool _visibleWidgetsStart = false;
  bool _visibleWidgetsEnd = false;
  double _water = 0.0;
  double _waterprogress = 0.0;
  double _watergoal = 1;
  bool goalreached = false;

  void addwater() {
    setState(() {
      _water += 0.250;
      _waterprogress = _water;
      if (_waterprogress == _watergoal)
      {
        goalreached = true;
      }
    });
  }
  void increasegoal() {
    setState(() {
      _watergoal += 0.250;
    });
  }
  void decreasegoal() {
    if (_watergoal != 0.25) {
      setState(() {
      _watergoal -= 0.250;
    });
    }
  }
  Future<void> _showStart() async {
    final TimeOfDay? result = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now());

    if (result != null) {
      setState(() {
        _alarmStart = result;
        _visibleWidgetsStart = true;
      });
    }
  }
  Future<void> _showEnd() async {
    final TimeOfDay? result = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now());

    if (result != null) {
      setState(() {
        _alarmEnd = result;
        _visibleWidgetsEnd = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Settings'),
        centerTitle:  true,
        backgroundColor: Colors.red.shade700
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget> [
          Padding(
            padding:EdgeInsets.all(16),
            child: Row(
              children: <Widget> [
                Text('Daily Goal',textScaleFactor:2),
                IconButton(
                  onPressed: decreasegoal,
                  icon: Icon(Icons.remove,color: Colors.red)
                  ),
                IconButton(
                  onPressed: increasegoal,
                  icon: Icon(Icons.add)
                  ),
                  const Flexible(fit: FlexFit.tight,child: SizedBox()),
                  Text("$_watergoal",textScaleFactor: 2),
                  Text('L',textScaleFactor: 2)
              ],
            ),
          ),
          LinearProgressIndicator(
            value: _waterprogress/_watergoal,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            backgroundColor: Colors.grey,
          ),
          Divider(height: 50),
          Row(
            children: <Widget> [
              TextButton.icon(
                onPressed: addwater, 
                icon: Icon(Icons.add), 
                label: Text('add cup')
              ),
              Image.asset('assets/images/water.png',height: 40, width : 40),
              Text("$_water"),
              Text('L'),
              const Flexible(fit: FlexFit.tight,child: SizedBox()),
              Visibility(
                visible: goalreached,
                
                child: Text('Goal reached!',textScaleFactor: 2))
            ],
          ),
          Divider(height: 50),
          SwitchListTile(
            value: _value,
            onChanged: (value) {
              setState(() {_value = value;});
              },
              activeColor: Colors.red.shade900,
              title: Text('Water reminder',textScaleFactor:1.7),
            ),
          Divider(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text('Time Interval(hrs)',textScaleFactor: 2),
              Text(_currentValue.toString(),textScaleFactor: 2),
              Slider(
                value: _currentValue,
                divisions: 8,
                min: 0.0,
                max: 4,
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              )
            ],
          ),
          Divider(height: 50),
          Row(
            children: <Widget> [
              Text('Start',textScaleFactor:2),
              const Flexible(fit: FlexFit.tight,child: SizedBox()),
              Visibility(
                child: TextButton(
                onPressed: _showStart, 
                child: Text('set time')
                ),
                visible: !_visibleWidgetsStart,
                ),
                Visibility(
                  child: Text(_alarmStart != null ? _alarmStart!.format(context) : ''),
                  visible: _visibleWidgetsStart,
                  ),
                Visibility(
                  child: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        _alarmStart = null;
                        _visibleWidgetsStart = false;
                      });
                      }
                    ),
                    visible: _visibleWidgetsStart
                  ),
            ],
          ),
          Divider(height: 50),
          Row(
            children: <Widget> [
              Text('End',textScaleFactor:2),
              const Flexible(fit: FlexFit.tight,child: SizedBox()),
              Visibility(
                child: TextButton(
                onPressed: _showEnd, 
                child: Text('set time')
                ),
                visible: !_visibleWidgetsEnd,
                ),
                Visibility(
                  child: Text(_alarmEnd != null ? _alarmEnd!.format(context) : ''),
                  visible: _visibleWidgetsEnd,
                  ),
                Visibility(
                  child: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        _alarmEnd = null;
                        _visibleWidgetsEnd = false;
                      });
                      }
                    ),
                    visible: _visibleWidgetsEnd
                  ),
            ],
          ),
        ],
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(item,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    )
  );
}

class Entry {
  TimeOfDay? alarm;
  Entry({this.alarm});
}
