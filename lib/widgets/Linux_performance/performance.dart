import 'package:authencicationtest/models/performance_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Performance extends StatefulWidget {
  @override
  _PerformanceState createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //this button helps the user get back to main page
      backgroundColor: Colors.black,
      //
      body: FutureBuilder<LinuxPerform>(
        //takes the fuction(which returns data to be used to be build) and gives it to builder
        future: fetchLinuxPerformaceData(http.Client(), 'info'),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? _build(snapshot.data, context)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _tile(String data, dynamic object) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Text(
            '$data : $object',
            style: TextStyle(color: Colors.amber[900]),
          ),
        ),
        Divider(
          color: Colors.white,
          height: 10,
        )
      ],
    );
  }

  Widget _build(LinuxPerform data, BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _tile('Operating System', data.osname),
            _tile('Architecture', data.architecture),
            _tile('OS type', data.ostype),
            _tile('No of CPU', data.noOfCpu),
            _tile('Total memory(bytes)', data.totalMemory),
            _tile('Docker server version', data.serverVersion),
            _tile('kernal version', data.kernalVersion),
            _tile('Total Containers', data.totalContainers),
            _tile('Running containers', data.runningContainers),
            _tile('Stopped Containers', data.stoppedContainer),
            _tile('Paused Containers', data.pausedContainers),
            _tile('Total images available', data.totalImagesAvailable),
          ],
        ),
      ),
    );
  }
}
