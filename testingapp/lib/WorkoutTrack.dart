import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class TrackListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrackListWidget();
}

class _TrackListWidget extends State<TrackListWidget> {
  final _formKey = GlobalKey<FormState>();
  final _WeightsController = TextEditingController();
  final _RepsController = TextEditingController();
  final _SetsController = TextEditingController();
  final _TimeController = TextEditingController();
  final _EmotionsController = TextEditingController();
   
  @override
  void dispose() {
    _WeightsController.dispose();
    _RepsController.dispose();
    _TimeController.dispose();
    _EmotionsController.dispose();
    super.dispose();
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
                inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],
                decoration: const InputDecoration(
                hintText: 'Weights(Kg)',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _WeightsController,
                /*validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'Title cannot be empty!';
                  return null;
                },*/
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],
                decoration: const InputDecoration(
                hintText: 'Sets',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _SetsController,
                /*validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'Title cannot be empty!';
                  return null;
                },*/
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],
                decoration: const InputDecoration(
                hintText: 'Reps',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _RepsController,
                /*validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'Title cannot be empty!';
                  return null;
                },*/
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],
                decoration: const InputDecoration(
                hintText: 'Time(minutes)',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _TimeController,
                /*validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'Title cannot be empty!';
                  return null;
                },*/
              ),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
              decoration: const InputDecoration(
                hintText: 'Emotions',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _EmotionsController,
                /*validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'Title cannot be empty!';
                  return null;
                },*/
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
                          final entry = WorkoutEntry(
                            Time: _TimeController.text,
                            Reps: _RepsController.text,
                            Weights: _WeightsController.text,
                            Emotions: _EmotionsController.text,
                            );
                          Navigator.pop(context, entry); 
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

class WorkoutEntry {
  String? Weights;
  String? Reps;
  String? Time;
  String? Emotions;

  //String? discription;
  WorkoutEntry({this.Weights,this.Reps,this.Time,this.Emotions});
}