import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/BreakfastTrack.dart';
import 'package:intl/intl.dart';
import 'package:testingapp/Goals.dart';
import 'package:flutter/services.dart';

class SetGoalWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SetGoalWidget();
}

class _SetGoalWidget extends State<SetGoalWidget> {
  final _formKey = GlobalKey<FormState>();
  var _categoryController = TextEditingController();
  final _valueController = TextEditingController();
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  String? category;
  var now = DateTime.now();
  var categories = ['strength' , 'speed', 'reps', 'distance','weight'];
  String? _currentSelectedValue;
  String _category='strength';
  String? newValue;

  final Emptyentry= null;
  DateTime selectedDate = DateTime.now();
  String formattedDate ='No Deadline' ;//= DateFormat('dd-MM-yyyy').format(selectedDate);

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
    _categoryController.dispose();
    _valueController.dispose();
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
        title: const Text('Set A goal'),
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
                hintText: 'Goal Name',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _titleController,
                validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'Title cannot be empty!';
                  return null;
                },
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Category',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _categoryController,
                validator: (value)  {
                  if (value == null || value.isEmpty)
                  return 'Title cannot be empty!';
                  return null;
                },
              ),
            ),*/
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text('  Category',
           style: TextStyle(color: Colors.black, fontSize: 16.0))
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:

            FormField<String>(
               builder: (FormFieldState<String> state) {
              return InputDecorator(
                  decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  hintText: 'Category',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                  ),
                  //isEmpty: Text('Category'),
                  //isEmpty: _currentSelectedValue == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String?>(
                    value: _currentSelectedValue,
                    isDense: true,
                    onChanged: (String? newValue) {
                    setState(() {
                      _currentSelectedValue = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: categories.map((String value) {
                     _categoryController.text=value;
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),                  
                ),
              ),
            );
          }
         ),
        ),
         /*Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new TextFormField(
                          controller: _categoryController,
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
                          _categoryController.text = value;
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
                */



        Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
              inputFormatters: <TextInputFormatter> [
                          FilteringTextInputFormatter.digitsOnly
                            ],
              decoration: const InputDecoration(
                hintText: 'Goal Value',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                keyboardType: TextInputType.number,
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
              child: TextField(
              decoration: const InputDecoration(
                hintText: 'Date',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller:_dateController,
                onTap: () => _selectDate(context),
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
                          final entry = GoalEntry(
                            titleEntry: _titleController.text,
                            valueEntry: double.parse(_valueController.text),
                            categoryEntry: _categoryController.text,
                            DateEntry: formattedDate,
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

class GoalEntry {
  String titleEntry;
  String categoryEntry;
  double valueEntry;
  String DateEntry;
  GoalEntry({required this.titleEntry,required this.categoryEntry,required this.valueEntry,required this.DateEntry});
}