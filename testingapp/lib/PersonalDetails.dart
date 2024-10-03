
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:testingapp/mainPage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PersonalDetailsWidget extends StatefulWidget{
  const PersonalDetailsWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetailsWidget> {
  final _BirthdayController = TextEditingController();
  final _HeightController = TextEditingController();
  final _WeightController = TextEditingController();
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _selectedGender = 'Other';
  final _PersonalInfoDetails = <PersonalInfoDetails>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          /*leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context/*,false*/),
          tooltip: 'Back',
          color: Colors.white,
          ),*/
          title: const Text('Conquer Fitness'),
          centerTitle:  true,
          backgroundColor: Colors.red.shade900
        ),
        
        body:Form(
        key:_formKey,
        child: Column(
        children: <Widget>[ 
        Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Personal Information',
                textScaleFactor: 1.5,
                textAlign: TextAlign.center),
              ),
        Padding(//Birthday
                padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget> [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('Age',
                          style:TextStyle(
                            color:Colors.black,
                            fontSize: 16,
                            ),                                   
                        ),
                      ),
                      const Flexible(fit:FlexFit.tight,child:SizedBox()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter> [
                          FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Age',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                ),
                              border: OutlineInputBorder(borderSide: BorderSide())
                              ),
                            controller: _BirthdayController,
                            validator: (Agevalue)  {
                            if (Agevalue == null || Agevalue.isEmpty)
                            return 'Age cannot be empty!';
                            return null;
                            },
                          ),
                        ),
                      ),
                    ]
                      ),
              ),
      Padding( //Height
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget> [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Height(m)',
                            style:TextStyle(
                              color:Colors.black,
                              fontSize: 16,
                              ),                                   
                          ),
                          ),
                          const Flexible(fit:FlexFit.tight,child:SizedBox()),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 200,
                                child: TextFormField(
                                  inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                hintText: 'Height(m)',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  ),
                                  border: OutlineInputBorder()
                                  ),
                                  controller: _HeightController,
                                  validator: (Heightvalue)  {
                                  if (Heightvalue == null || Heightvalue.isEmpty)
                                  return 'Height cannot be empty!';
                                  return null;
                                  },    
                                ),
                              ),
                            ),
                        ]
                            ),
      ),
      Padding( //Weight
                padding: const EdgeInsets.all(8.0),
                child: Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('Weight(kg)',
                      style:TextStyle(
                        color:Colors.black,
                        fontSize: 16,
                        ),                                   
                        ),
                    ),
                  const Flexible(fit:FlexFit.tight,child:SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: TextFormField(
                        inputFormatters: [WhitelistingTextInputFormatter(RegExp(r'(^\d*\.?\d*)'))],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Weight(kg)',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            ),
                          border: OutlineInputBorder()
                          ),
                        controller: _WeightController,
                        validator: (Weightvalue)  {
                        if (Weightvalue == null || Weightvalue.isEmpty)
                        return 'Weight cannot be empty!';
                        return null;
                        },    
                      ),
                    ),
                  ),
                ]
                ),
                ),
      Padding( //Gender
                padding: const EdgeInsets.all(8.0),
                  child: Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('Gender',
                      style:TextStyle(
                        color:Colors.black,
                        fontSize: 16,
                        ),                                   
                        ),
                    ),
                  const Flexible(fit:FlexFit.tight,child:SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                         SizedBox(
                          width: 150,
                          child: ListTile(
                            leading: Radio<String>(
                            value: 'male',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                              _selectedGender = value!;
                              });
                            },
                            ),
                          title: const Text('Male'),
                          ),
                         ),
                         SizedBox(
                          width: 150,
                          child:ListTile(
                            leading: Radio<String>(
                            value: 'female',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                              _selectedGender = value!;
                              });
                            },
                          ),
                            title: const Text('Female'),
                          ),
                         ),
                          SizedBox(
                          width: 150,
                          child: ListTile(
                            leading: Radio<String>(
                            value: 'Other',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                              _selectedGender = value!;
                              });
                            },
                          ),
                            title: const Text('Other'),
                          ),
                          ),
                        ]
                  ),
                    ),
                ],
      )
      ),
                ElevatedButton(style: ElevatedButton.styleFrom(
                primary:Colors.red.shade700, textStyle: TextStyle(color: Colors.white,)), 
                onPressed: () {
                  if (_formKey.currentState!.validate()){
                    /* final entry = Entry (
                    title: _HeightController.text
                    ); */
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPageWidget()));
                    }
                },
                child: Text('End'),
                ),
      ]
    )
      )   
    
      ),
    );
  }
}

class PersonalInfoDetails {
  String Username;
  String Email;
  String Password;
  PersonalInfoDetails ({required this.Username ,required this.Email , required this.Password });
}