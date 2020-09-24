import 'package:authencicationtest/models/docker_json_data.dart';
import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  final Jsondata containerdata;

  Containers(this.containerdata);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          containerdata.name[0].toString().substring(1),
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
