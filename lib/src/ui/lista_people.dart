import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ine/src/model/people.dart';
import 'package:ine/src/ui/info_people.dart';
import 'package:ine/src/ui/screen_people.dart';
import 'package:async/async.dart';

final personaref = FirebaseDatabase.instance.reference().child('Persona');
late List<Persona> items;

class ListViewPerson extends StatefulWidget {
  const ListViewPerson({Key? key}) : super(key: key);

  @override
  _ListViewPersonState createState() => _ListViewPersonState();
}

class _ListViewPersonState extends State<ListViewPerson> {
  late StreamSubscription<Event> addPersona;
  late StreamSubscription<Event> changePersona;

  @override
  void initState() {
    super.initState();
    items = []; //new List();

    addPersona = personaref.onChildAdded.listen(mAddPersona);

    changePersona = personaref.onChildAdded.listen(mUpdatePersona);
  }

  void dispose() {
    super.dispose();
    addPersona.cancel();
    changePersona.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listado'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.only(top: 12.0),
            itemBuilder: (context, position) {
              return Column(
                children: <Widget>[
                  Divider(
                    height: 7.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: Text(
                            '${items[position].nombre}',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 15.0),
                          ),
                          subtitle: Text('${items[position].apellido}',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 13.0)),
                          leading: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 13,
                                child: Text(
                                  '${position + 1}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                          onTap: () => _infoPersona(context, items[position]),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.delete, color: Colors.purpleAccent),
                          onPressed: () => _showDialog(context, position)),
                      IconButton(
                          icon: Icon(Icons.edit, color: Colors.purpleAccent),
                          onPressed: () =>
                              _verPersona(context, items[position])),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.pink),
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () => _agregarPersona(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _showDialog(context, position) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alerta'),
            content: Text('Realmente quiere eliminar el registro?'),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () =>
                      _borrarPersona(context, items[position], position)),
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'))
            ],
          );
        });
  }

  void _borrarPersona(
      BuildContext context, Persona persona, int position) async {
    print("Borrar " + persona.id + " position:" + position.toString() + " ");
    await personaref.child(persona.id).remove().then((_) {
      setState(() {
        items.remove(position);
        Navigator.of(context).pop();
      });
    });
  }

  void _agregarPersona(BuildContext event) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ScreenPersona(Persona('', '', '', '', '', '', ''))));
  }

  void _verPersona(BuildContext context, Persona persona) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => InfoPersona(persona)));
  }

  void _infoPersona(BuildContext context, Persona persona) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ScreenPersona(persona)));
  }

  void mAddPersona(Event event) {
    setState(() {
      items.add(new Persona.fromSnapShot(event.snapshot));
    });
  }

  void mUpdatePersona(Event event) {
    var oldPersona =
        items.singleWhere((persona) => persona.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldPersona)] =
          new Persona.fromSnapShot(event.snapshot);
    });
  }
}
