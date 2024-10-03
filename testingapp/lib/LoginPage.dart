import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testingapp/PersonalDetails.dart';
import 'package:testingapp/create_account.dart';
import 'package:testingapp/mainPage.dart';

class LoginPageWidget extends StatefulWidget{
  const LoginPageWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageWidget>{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {   
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red.shade900,
        body:ListView(
            children: <Widget>[
            Container(
              width: 500.0,
              height: 500.0,
              decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/circlewithquote.png',),
                alignment: Alignment(0.0,0.0),
                ),
            ),
            ),            
            Align(
              alignment: Alignment(0.0,0.90),
              child:SizedBox(
                height:300,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20,
                          color: Colors.black),
                          )
                          ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'User Name',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            )
                            ),
                          ),
                          ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: ('Password'),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              )
                          ),
                          ),
                        ),
                      /*TextButton(
                        onPressed: () {},
                        child: Text('Forgot Password',
                          style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,//should be white
                          ),
                          ),
                        ),
                       */
                      Padding(padding:
                      EdgeInsets.all(8.0)),

                      Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                          ),
                          ),
                          ),
                          child: Text('Login',
                            style: TextStyle(
                            color: Colors.red.shade900,
                            fontSize: 15,
                            ),
                            ),
                            onPressed: () {
                              print(nameController.text);
                              print(passwordController.text);
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPageWidget()));}
                          )
                          ),
                      TextButton(
                        child: Text('Register',
                        style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        ) ,
                        ),
                        onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateAccountWidget()));}
                      ),
                    ]
                  ),
                ),
                          ),
          //],
                  ),
      
            ]
                )          //mainAxisAlignment: MainAxisAlignment.center,
            ),
            
    );
  }
}