
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testingapp/LoginPage.dart';


void main() {
  runApp(const ConquerFitness());
}

class ConquerFitness extends StatelessWidget {
  const ConquerFitness({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conquer Fitness',
      theme: ThemeData( 
        backgroundColor: Colors.red[900],
        ),    
      home: StartPageWidget(),
      );
  }
}
class StartPageWidget extends StatefulWidget{
  const StartPageWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _StartPageWidgetState();
}
class _StartPageWidgetState extends  State<StartPageWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        decoration: BoxDecoration(
            color: Colors.red.shade900,
            image: DecorationImage(
              //fit: BoxFit.contain,
              image: AssetImage('assets/images/circlewithquote.png'),
              alignment: Alignment(0.0,0.0),
              ),
          ),
            child: Align(
              alignment: Alignment(0.0,0.75),
            child: SizedBox(
            height: 40,
            width:200,
              child: ElevatedButton(    
              style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red.shade700)
                  ),
                 ),
                 ),        
                  child: Text('Start',
                  style:TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 16,
                    ),
                    ),
                    onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPageWidget()));}
                    ),
                    ),
            ),
                    ),
      );
}
}