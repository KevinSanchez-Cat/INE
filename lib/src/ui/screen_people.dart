import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ine/src/model/people.dart';

final personaref = FirebaseDatabase.instance.reference().child('Persona');

class ScreenPersona extends StatefulWidget {
  final Persona persona;
  ScreenPersona(this.persona);
  @override
  _ScreenPersonaState createState() => _ScreenPersonaState();
}

class _ScreenPersonaState extends State<ScreenPersona> {
  late List<Persona> items;
  late TextEditingController nombreController;
  late TextEditingController apellidoController;
  late TextEditingController fechaNacimientoController;
  late TextEditingController emailController;
  late TextEditingController telefonoController;
  late TextEditingController direccionController;

  @override
  void initState() {
    super.initState();
    nombreController = new TextEditingController(text: widget.persona.nombre);
    apellidoController =
        new TextEditingController(text: widget.persona.apellido);
    fechaNacimientoController =
        new TextEditingController(text: widget.persona.fechaNacimiento);
    telefonoController =
        new TextEditingController(text: widget.persona.telefono);
    direccionController =
        new TextEditingController(text: widget.persona.direccion);
    emailController = new TextEditingController(text: widget.persona.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Persona'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Center(
                child: Column(
              children: <Widget>[
                TextField(
                  controller: nombreController,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 18.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Nombre',
                  ),
                  keyboardType: TextInputType.text,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                TextField(
                  controller: apellidoController,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 18.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Apellido',
                  ),
                  keyboardType: TextInputType.text,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                TextField(
                  controller: fechaNacimientoController,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 18.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'FechaNacimiento',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                TextField(
                  controller: direccionController,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 18.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person_pin),
                    labelText: 'Direccion',
                  ),
                  keyboardType: TextInputType.text,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                TextField(
                  controller: telefonoController,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 18.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: 'Telefono',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                TextField(
                  controller: emailController,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 18.0),
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Divider(),
                FlatButton(
                    onPressed: () {
                      if (widget.persona.id != null) {
                        personaref.child(widget.persona.id).set({
                          'nombre': nombreController.text,
                          'apellido': apellidoController.text,
                          'telefono': telefonoController.text,
                          'email': emailController.text,
                          'direccion': direccionController.text,
                          'fechaNacimiento': fechaNacimientoController.text
                        }).then((_) => {Navigator.pop(context)});
                      } else {
                        personaref.push().set({
                          'nombre': nombreController.text,
                          'apellido': apellidoController.text,
                          'telefono': telefonoController.text,
                          'email': emailController.text,
                          'direccion': direccionController.text,
                          'fechaNacimiento': fechaNacimientoController.text
                        }).then((_) => {Navigator.pop(context)});
                      }
                    },
                    child: (widget.persona.id != null)
                        ? Text('Update')
                        : Text('Agregar')),
              ],
            )),
          ),
        ));
  }
}
