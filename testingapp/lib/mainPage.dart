import 'dart:ui';
import 'package:testingapp/main.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/create_WorkoutSplit.dart';
import 'package:testingapp/Create_Split.dart';
import 'package:testingapp/workouts.dart';
import 'package:testingapp/MealTracking.dart';
import 'package:testingapp/WorkoutTracking.dart';
import 'package:testingapp/Goals.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

@immutable

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {

  static const _actionTitles = ['Home Page', 'Workout Split', 'Skill Tracking','Workouts'];

  //const MainPageWidget({Key? key}) : super(key: key);
  final date = DateTime.now();
  //String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String now = DateFormat("dd-MM-yyyy").format(DateTime.now());
  //String now = DateFormat("yyyy-MM-dd – kk:mm").format(DateTime.now());

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,        
          title: const Text('Conquer Fitness'),
          centerTitle:  true,
          backgroundColor: Colors.red.shade900
          ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //IconButton(onPressed: () {/* Navigator.of(context).push(MaterialPageRoute(builder: (context) => StartPageWidget()));*/},icon: const Icon(Icons.home),tooltip: 'Home Page'),
            //IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutSplitWidget()));*/}, icon: const Icon(Icons.calendar_today),tooltip: 'Workout Split'),
            //IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkillTrackingWidget()));*/}, icon: const Icon(Icons.trending_up),tooltip: 'Skill Tracking'),
            //IconButton(onPressed: () {/*Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutWidget()));*/},  icon: const Icon(Icons.fitness_center),tooltip: 'Workouts'),
            ],
          ),
          color: Colors.red.shade900
        ),
      body: ListView(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                children: <Widget> [
                  Text('Welcome Back,',/*textAlign: TextAlign.center*/style: TextStyle(color: Colors.grey)),
                  Text('Username',
                  style: TextStyle(color: Colors.black, fontSize: 28.0,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Text (now,textAlign: TextAlign.center, textScaleFactor: 2,style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Image.asset('assets/images/intro_image.png',height:100,width: 100),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutTrackingWidget()));}, 
                  icon: const Icon(Icons.fitness_center), label: Text('Workout Tracking'),style: ElevatedButton.styleFrom(
                  primary:Colors.red.shade900, textStyle: TextStyle(color: Colors.white,))),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatisticsWidget()));},
                  icon: const Icon(Icons.trending_up), label: Text('Track Goals'),style: ElevatedButton.styleFrom(
                  primary:Colors.red.shade900, textStyle: TextStyle(color: Colors.white,))),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealTrackingWidget()));},
                  icon: const Icon(Icons.restaurant), label: Text('Meal Tracking'),style: ElevatedButton.styleFrom(
                primary:Colors.red.shade900, textStyle: TextStyle(color: Colors.white,))),
                ],
      ),
      floatingActionButton: ExpandableFab(
        distance: 112.0,
        children: [
          FloatingActionButton(
            onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutSplitWidget()));},
            child: const Icon(Icons.calendar_today),
            backgroundColor: Colors.red.shade900,
            tooltip: 'Create Workout Split',
          ),
          FloatingActionButton(
            onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutWidget()));},
            child: const Icon(Icons.fitness_center),
            backgroundColor: Colors.red.shade900,
            tooltip: 'Create Workout',
          ),
          FloatingActionButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatisticsWidget())),
            child: const Icon(Icons.trending_up),
            backgroundColor: Colors.red.shade900,
            tooltip: 'Set Goals',
          ),
          
        ],
      ),
    );
  }
}

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    Key? key,
    this.initialOpen,
    required this.distance,
    required this.children,
  }) : super(key: key);

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: _toggle,
            child: const Icon(Icons.menu),
            backgroundColor: Colors.red.shade900,
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    Key? key,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.secondary,
      elevation: 4.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: theme.colorScheme.secondary,
      ),
    );
  }
}

@immutable
class FakeItem extends StatelessWidget {
  const FakeItem({
    Key? key,
    required this.isBig,
  }) : super(key: key);

  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      height: isBig ? 128.0 : 36.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: Colors.grey.shade300,
      ),
    );
  }
}