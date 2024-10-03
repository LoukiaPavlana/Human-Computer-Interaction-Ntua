import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testingapp/food.dart';


class SnackTrackWidget extends StatefulWidget {
  const SnackTrackWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SnackTrackWidgetState();
}

class _SnackTrackWidgetState extends State<SnackTrackWidget> {
  final _foods = <Food> [];

  void _deleteFood(int idx) async{
    bool? _delFood = await showDialog<bool>(
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
    if (_delFood!) {
      _foods.removeAt(idx);
      setState(() {});
    }
  }
  void _addNewFood() async{
    final FoodEntry _newEntry = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AddFoodWidget()));
    if (_newEntry!= null) {
      //Add the new food
        _foods.add(Food(
        food: _newEntry.titleEntry,
        grams: _newEntry.gramsEntry,
        calories: _newEntry.caloriesEntry,
      ));
      //Redraw the widget
      setState(() {});
    }
  }

  Widget _buildFoodList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _foods.length, //posa stoixeia tha exei h lista
      separatorBuilder: (context,index) => const Divider(), //eidos diaxwristikou
      itemBuilder: (context, index) {
        IconData iconData;
        String toolTip;
        TextDecoration txtDec; 
        return ListTile(
            title:  Text(_foods[index].food, ),
            subtitle: Column(
              children: <Widget>[
                Row( children: [
                Text('Grams:'),
                Text (_foods[index].grams,
                textAlign: TextAlign.left,
                ),
                ]
                ),
                Row( children: [
                Text('Calories:') ,
                Text (_foods[index].calories,
                textAlign: TextAlign.left 
                ),
                ]
                ),
                ]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {_deleteFood(index);
              },
              tooltip: 'Delete Entry'
              ),
          );
    
      }   
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Foods'),
        centerTitle:  true,
        backgroundColor: Colors.red.shade900
      ),
      body: _buildFoodList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _addNewFood,
        backgroundColor: Colors.red.shade900,
        tooltip: 'Add Food',
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class Food {
  String food;
  String grams;
  String calories;
  Food({required this.food , required this.grams, required this.calories});
}

class GoalTrack {
  String Value;
  String Date;
  //String? discription;
  GoalTrack({required this.Value, required this.Date});
}