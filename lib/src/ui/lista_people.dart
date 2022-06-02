import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ine/src/model/people.dart';
import 'package:ine/src/ui/info_people.dart';
import 'package:ine/src/ui/screen_people.dart';
import 'dart.async';

class ListViewPerson extends StatefulWidget {
  const ListViewPerson({Key? key}) : super(key: key);

  @override
  _ListViewPersonState createState() => _ListViewPersonState();
}

class _ListViewPersonState extends State<ListViewPerson> {}
