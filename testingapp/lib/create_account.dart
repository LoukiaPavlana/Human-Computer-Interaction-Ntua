import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testingapp/main.dart';
import 'package:flutter/services.dart';
import 'package:testingapp/PersonalDetails.dart';
import 'package:testingapp/mainPage.dart';
import 'package:testingapp/PersonalDetails.dart';


class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CreateAccountWidgetState();
}
String? pass;

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  final _formKey = GlobalKey<FormState>();
  final _UsernameController = TextEditingController();
  final _PasswordController = TextEditingController();
  final _RepeatPasswordController = TextEditingController();
  final _EmailController = TextEditingController();

  final _PersonalInfoDetails = <PersonalInfoDetails>[];
  @override 
  void dispose(){
    _UsernameController.dispose();
    _PasswordController.dispose();
    _RepeatPasswordController.dispose();
    _EmailController.dispose();
    super.dispose();
  }
  void _TakeUsername () async {
      if (_formKey.currentState!.validate()){
        /*final Entry = _newentry ( //to collect the values for the TextFormFields
            Username: _UsernameController.text ,
            Email: _EmailController.text,
            Password: _EmailController.text,
            ); */
        final Entry _PersonalInfoDetails = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalDetailsWidget()));
       /*if (_TakeUsername!=null){
          _PersonalInfo.add(_PersonalInfoDetails (
            Username: _PersonalInfoDetails.Username, 
            Email: _PersonalInfoDetails.Email, 
            ));
        }*/
        }
        }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context/*,false*/),
          tooltip: 'Back',
          ),
        title: const Text('Set up your Account!'),
        centerTitle:  true,
        backgroundColor: Colors.red.shade900
      ),
      body: Form (
      key:_formKey,        
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Text('Hey there,',textAlign: TextAlign.center),
          Text('Create an Account',textScaleFactor: 1.5,textAlign: TextAlign.center),
          const SizedBox(height: 16),
          TextFormField(
              decoration: const InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(borderSide: BorderSide())
              ),
              controller: _UsernameController,
              validator: (value)  {
              if (value == null || value.isEmpty)
              return 'Username cannot be empty!';
              return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'email',
                border: OutlineInputBorder(borderSide: BorderSide())
              ),
              controller: _EmailController,
              validator: (value)  {
              if (value == null || value.isEmpty)
              return 'Email cannot be empty!';
              return null;
               },
            ),
             const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _PasswordController,
                validator: (Agevalue)  {
                  pass = Agevalue;
                if (Agevalue == null || Agevalue.isEmpty)
                  return 'Password cannot be empty!';
                  return null;
                  },
              ),
              const SizedBox(height: 16), 
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Repeat Password',
                border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _RepeatPasswordController,
                validator: (Agevalue)  {
                if (Agevalue != pass)
                  return 'Passwords do not match!';
                  return null;
                  },
              ),                        
            const SizedBox(height: 16),
            RaisedButton(color: Colors.red.shade700, textColor: Colors.white,
            onPressed: _TakeUsername,
            child: Text('Register'),
            ),
        ],
      )
      ),
              );  
  }
}



Widget buildUsername() => TextField(
  decoration: InputDecoration(
    labelText: 'Username',
    border: OutlineInputBorder(),
  ),
);

class Entry {
  String Username;
  String Email;
  String Password;
  Entry({required this.Username ,required this.Email , required this.Password });
}