import 'package:flutter/material.dart';
import 'package:testingapp/Create_WorkoutSplit.dart';

class ViewEditSplitWidget extends StatefulWidget {
  const ViewEditSplitWidget({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewEditSplitWidgetState();
}

class _ViewEditSplitWidgetState extends State<ViewEditSplitWidget> {
  String? valueMo,valueTu,valueWe,valueTh,valueFr,valueSa,valueSu;
  List lista = ['','','','','','',''];
  final items = ['Abs','Lowerbody','Upperbody','Cardio'];
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  //final _listaController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    //_listaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View / Edit Split'),
        backgroundColor: Colors.red.shade900
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [

            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Split Title',
                  border: OutlineInputBorder(borderSide: BorderSide())
                ),
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title cannot be empty!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Monday'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton <String> (
                      value: valueMo,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) {setState(() => this.valueMo = value); lista[0] = value;}//(value) => setState(() => this.valueMo = value),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Tuesday'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton <String> (
                      value: valueTu,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) {setState(() => this.valueTu = value); lista[1] = value;}
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Wednesday'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton <String> (
                      value: valueWe,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) {setState(() => this.valueWe = value); lista[2] = value;}
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Thursday'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton <String> (
                      value: valueTh,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) {setState(() => this.valueTh = value); lista[3] = value; }
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Friday'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton <String> (
                      value: valueFr,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) {setState(() => this.valueFr = value); lista[4] = value; }
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Saturday'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton <String> (
                      value: valueSa,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) {setState(() => this.valueSa = value); lista[5] = value; }
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Sunday'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton <String> (
                      value: valueSu,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) {setState(() => this.valueSu = value); lista[6] = value;}
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget> [
                  Flexible(child: SizedBox(),fit: FlexFit.tight),
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
                        if (_formKey.currentState!.validate()) {
                          final entry = Entry(
                            title: _titleController.text,
                            //lista: _listaController.text,
                          );
                          Navigator.pop(context,entry);
                        }
                      },
                      child: const Text('Save'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red.shade900)
                      ),
                      ),
                    )
                ],
              ),
              )
          ],
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(item,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    )
  );

class Entry{
  String title;
  //List? lista;
  Entry({required this.title, /*this.lista*/});
}