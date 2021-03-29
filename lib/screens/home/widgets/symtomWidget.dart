import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SymptomWidget extends StatefulWidget {
  @override
  _SymptomWidgetState createState() => _SymptomWidgetState();
}

class _SymptomWidgetState extends State<SymptomWidget> {
  final _formKey = GlobalKey<FormState>();

  List<String> _symptomes = [
    "Oeil qui gratte",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _symptomes.length,
            itemBuilder: (context, index) {
              return _symptomCard(_symptomes[index]);
            },
          ),
        ),
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _symptomCard(String title) {
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("SUPPRIMER"),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              );
            });
      },
      child: Card(
        elevation: 3,
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: TextStyle(fontSize: 20)),
              Checkbox(value: true, onChanged: (value) {}),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Depuis:"),
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Chip(
                    backgroundColor: Colors.blue,
                    label: Text(
                      '30 minutes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.orange,
                    label: Text(
                      '2 heures',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.blue,
                    label: Text(
                      'matinée',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.blue,
                    label: Text(
                      'journée',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              String symptom;
              return Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Quel type de symptome as-tu ?',
                            labelText: 'Symptome',
                          ),
                          onChanged: (value) {
                            symptom = value;
                          },
                          validator: (value) {
                            return value.isEmpty ? 'Il faut renseigner le symptome !' : null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _symptomes.add(symptom);
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Ajouter"),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            });
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}
