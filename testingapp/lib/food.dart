import 'package:flutter/material.dart';
import 'package:testingapp/BreakfastTrack.dart';
import 'package:flutter/services.dart';

class AddFoodWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddFoodWidget();
}

class _AddFoodWidget extends State<AddFoodWidget> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _gramsController = TextEditingController();
  final _caloriesController = TextEditingController();
  final Emptyentry= null;

  void _CancelBackButton () async{
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

  @override
  void dispose() {
    _titleController.dispose();
    _gramsController.dispose();
    _caloriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
             _CancelBackButton();
          },
          tooltip: 'Back',
          color: Colors.white,
          ),
        title: const Text('Add Food'),
        backgroundColor: Colors.red.shade900
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Food',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _titleController,
                validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'This Field cannot be empty!';
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Grams',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],
                controller: _gramsController,
                validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'This Field cannot be empty!';
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Calories',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _caloriesController,
                validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'This Field cannot be empty!';
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
                        _CancelBackButton();
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
                          final entry = FoodEntry(
                            titleEntry: _titleController.text,
                            gramsEntry: _gramsController.text,
                            caloriesEntry: _caloriesController.text,
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

class FoodEntry {
  String titleEntry;
  String caloriesEntry;
  String gramsEntry;
  //String? discription;
  FoodEntry({required this.titleEntry,required this.caloriesEntry,required this.gramsEntry});
}