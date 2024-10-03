import 'package:flutter/material.dart';
import 'package:testingapp/Goals.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
import 'package:testingapp/Create_Split.dart';
import 'package:testingapp/mainPage.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/BreakfastTrack.dart';
import 'package:testingapp/BreakfastTrack.dart';
import 'package:testingapp/LunchTrack.dart';
import 'package:testingapp/DinnerTrack.dart';
import 'package:testingapp/SnackTrack.dart';
import 'package:testingapp/WaterSettings.dart';

class MealTrackingWidget extends StatefulWidget{
  const MealTrackingWidget ({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MealTrackingState();
}

class _MealTrackingState extends State<MealTrackingWidget> {
  @override
  Widget build(BuildContext context) {
    Color selection;
    return MaterialApp(
      title: 'Conquer Fitness',
      theme: ThemeData( 
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red.shade900,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context/*,false*/),
          tooltip: 'Back',
          color: Colors.white,
          ),
          centerTitle:  true,
          title: const Text(
            'Meal Tracking',
            textAlign: TextAlign.center,

            ),
        ),
        bottomNavigationBar:BottomAppBar(
         color: Colors.red[900] ,
         child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPageWidget()));}, icon: const Icon(Icons.home),tooltip: 'Home Page'),
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutSplitWidget()));}, icon: const Icon(Icons.calendar_today),tooltip: 'Workout Split'),
            IconButton(onPressed: () {Navigator.pop(context); Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatisticsWidget()));},   icon: const Icon(Icons.trending_up),tooltip: 'Set Goals'),
            IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutWidget()));},   icon: const Icon(Icons.fitness_center),tooltip: 'Workouts'),],
            ),
        ),              
        ),
        body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget> [
          const SizedBox(height: 30),
          Text('My Meals:', textScaleFactor: 2,style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(//Breakfast
          alignment: Alignment.center,
          margin: EdgeInsets.all(8),
          height: 130,
          child: Stack(
            children: <Widget> [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                    Text('Breakfast',style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold) ,),                    
                    const SizedBox(height: 25),
                    ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => BreakfastTrackWidget()));}, child: Text('+ Add'), style: ElevatedButton.styleFrom(primary: Colors.red.shade900,onPrimary: Colors.white))
                    ],),
                    )
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/breakfast.png')
                    )
                )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.red.shade200,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              height: 130,
              child: Stack(
              children: <Widget> [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      Text('Lunch',style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold) ,),
                    const SizedBox(height: 25),
                    ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => LunchTrackWidget()));}, child: Text('+Add'), style: ElevatedButton.styleFrom(primary: Colors.red.shade900,onPrimary: Colors.white))
                    ],),
                    )
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/lunch.png')
                    )
                )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.red.shade200,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),

            //Dinner
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              height: 130,
              child: Stack(
              children: <Widget> [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      Text('Dinner',style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold) ,),
                    const SizedBox(height: 25),
                    ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => DinnerTrackWidget()));}, child: Text('+Add'), style: ElevatedButton.styleFrom(primary: Colors.red.shade900,onPrimary: Colors.white))
                    ],),
                    )
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/dinner.png')
                    )
                )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.red.shade200,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
             Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              height: 130,
              child: Stack(
              children: <Widget> [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      Text('Snack',style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold) ,),
                    const SizedBox(height: 25),
                    ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => SnackTrackWidget()));}, child: Text('+Add'), style: ElevatedButton.styleFrom(primary: Colors.red.shade900,onPrimary: Colors.white))
                    ],),
                    )
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/snack.png')
                    )
                )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.red.shade200,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            //Water
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              height: 130,
              child: Stack(
              children: <Widget> [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      Text('Water',style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold) ,),
                    const SizedBox(height: 25),
                    ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => WaterSettingsWidget()));}, child: Text('+Add'), style: ElevatedButton.styleFrom(primary: Colors.red.shade900,onPrimary: Colors.white))
                    ],),
                    )
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/water.png')
                    )
                )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.red.shade200,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),

            ],
          ),  
      ),
    );
  }
}