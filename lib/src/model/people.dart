import 'package:firebase_database/firebase_database.dart';

class Persona {
  String id = "";
  String nombre = "";
  String apellido = "";
  String fechaNacimiento = "";
  String telefono = "";
  String direccion = "";
  String email = "";
  String get getId => this.id;

  Persona(this.id, this.nombre, this.apellido, this.fechaNacimiento,
      this.direccion, this.telefono, this.email);

  Persona.map(dynamic obj) {
    nombre = obj['nombre'];
    apellido = obj['apellido'];
    fechaNacimiento = obj['fechaNacimiento'];
    direccion = obj['direccion'];
    telefono = obj['telefono'];
    email = obj['email'];
  }

  set setId(String id) => this.id = id;

  get getNombre => this.nombre;

  set setNombre(nombre) => this.nombre = nombre;

  get getApellido => this.apellido;

  set setApellido(apellido) => this.apellido = apellido;

  get getFechaNacimiento => this.fechaNacimiento;

  set setFechaNacimiento(fechaNacimiento) =>
      this.fechaNacimiento = fechaNacimiento;

  get getTelefono => this.telefono;

  set setTelefono(telefono) => this.telefono = telefono;

  get getDireccion => this.direccion;

  set setDireccion(direccion) => this.direccion = direccion;

  get getEmail => this.email;

  set setEmail(email) => this.email = email;

  Persona.fromSnapShot(DataSnapshot snapshot) {
    id = snapshot.key;
    nombre = snapshot.value['nombre'];
    apellido = snapshot.value['apellido'];
    fechaNacimiento = snapshot.value['fechaNacimiento'];
    telefono = snapshot.value['telefono'];
    email = snapshot.value['email'];
    direccion = snapshot.value['direccion'];
  }
}
