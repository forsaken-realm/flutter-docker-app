import 'package:authencicationtest/models/performance_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Performance extends StatefulWidget {
  final Future<List<LinuxPerform>> lista =
      fetchLinuxPerformaceData(http.Client(), 'getresouces.sh');

  @override
  _PerformanceState createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  @override
  Widget build(BuildContext context) {
    widget.lista.whenComplete(() => print(widget.lista));
    return Container();
  }
}
