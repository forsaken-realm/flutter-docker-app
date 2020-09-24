import 'package:authencicationtest/models/docker_json_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'docker_ps_singal_container.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //this button helps the user get back to main page
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: RaisedButton(
          elevation: 22,
          onPressed: () => Navigator.pop(context),
          child: Text('Go back'),
          color: Colors.amber[900],
        ),
      ),
      backgroundColor: Colors.black,
      //
      body: FutureBuilder<List<Jsondata>>(
        //takes the fuction(which returns data to be used to be build) and gives it to builder
        future: fetchDockerContainerData(
            http.Client(), 'containers/json?all=1&before=8dfafdbc3a40&size=1'),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? DockerList(containers: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class DockerList extends StatelessWidget {
  final List<Jsondata> containers;

  DockerList({Key key, this.containers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(46, 46, 46, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    //radius: 30,
                    backgroundColor: Colors.amber[900],
                    child: Text(
                      containers[index]
                          .name[0]
                          .toString()
                          .substring(1, 2)
                          .toUpperCase(),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        containers[index]
                                    .name[0]
                                    .toString()
                                    .substring(1)
                                    .length >
                                15
                            ? containers[index]
                                    .name[0]
                                    .toString()
                                    .substring(1, 10) +
                                '...'
                            : containers[index].name[0].toString().substring(1),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      Text(
                        'Image used:  ${containers[index].image}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    containers[index].state.toUpperCase(),
                    style: TextStyle(
                        color: containers[index].state == "exited"
                            ? Colors.red
                            : Colors.green[900],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Containers(containers[index]),
            ),
          ),
        );
      },
      itemCount: containers.length,
    );
  }
}
