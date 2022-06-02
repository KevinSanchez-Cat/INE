import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ine/src/model/people.dart';

class InfoPersona extends StatefulWidget {
  final Persona persona;
  InfoPersona(this.persona);

  @override
  _InfoPersonaState createState() => _InfoPersonaState();
}

class _InfoPersonaState extends State<InfoPersona> {
  late List<Persona> items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Información'),
          backgroundColor: Colors.green,
        ),
        body: Container(
          height: 400,
          padding: const EdgeInsets.all(20.0),
          child: Card(
              child: Center(
                  child: Column(
            children: <Widget>[
              new Text(
                "Nombre: ${widget.persona.nombre}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Apellidos: ${widget.persona.apellido}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Fecha de nacimiento: ${widget.persona.fechaNacimiento}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Telefono: ${widget.persona.telefono}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Email: ${widget.persona.email}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
              new Text(
                "Dirección: ${widget.persona.direccion}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Divider(),
            ],
          ))),
        ));
  }
}
