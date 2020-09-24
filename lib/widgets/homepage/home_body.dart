import 'package:flutter/material.dart';
import '../../models/server.dart';
import 'package:http/http.dart' as http;

class Mybody extends StatefulWidget {
  final double screenWidth, screenHeight;
  final images = server(
      'docker images --format \'{"ID":"{{.Repository}}"},\'', http.Client());

  Mybody({this.screenHeight, this.screenWidth});

  @override
  _MybodyState createState() => _MybodyState();
}

class _MybodyState extends State<Mybody> {
  final nametext = TextEditingController();
  final imagetext = TextEditingController();
  final ScrollPhysics scrollPhysics = ScrollPhysics();

  String dropDownValue = 'Isolated';
  void submitted() {
    final enterdname = nametext.text;
    final enterdimage = imagetext.text;
    if (enterdimage != null && enterdname != null) {
      nametext.clear();
      imagetext.clear();
    }
    print(enterdimage);
    print(enterdname);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.images);
    return SingleChildScrollView(
      physics: scrollPhysics,
      child: Container(
        width: widget.screenWidth,
        height: widget.screenHeight,
        color: Colors.black,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: widget.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(46, 46, 46, 1),
                ),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter Image name',
                        labelStyle: TextStyle(
                          color: Colors.amber[900],
                        ),
                      ),
                      onSubmitted: (_) {
                        submitted();
                      },
                      style: TextStyle(color: Colors.white),
                      controller: imagetext,
                    ),
                    TextField(
                      controller: nametext,
                      decoration: InputDecoration(
                        labelText: 'Enter container name',
                        labelStyle: TextStyle(
                          color: Colors.amber[900],
                        ),
                      ),
                      onSubmitted: (_) => submitted(),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                      dropdownColor: Colors.black,
                      value: dropDownValue,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.amber[900]),
                      underline: Container(
                        height: 2,
                        color: Colors.amber[900],
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropDownValue = newValue;
                        });
                      },
                      items: <String>['Ports Exposed', 'Isolated']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RaisedButton(
                      splashColor: Colors.amber[400],
                      color: Colors.amber[900],
                      onPressed: submitted,
                      child: Text(
                        'Launch',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: widget.screenHeight * 0.2,
                    width: widget.screenWidth * 0.45,
                    color: Color.fromRGBO(46, 46, 46, 1),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: widget.screenHeight * 0.2,
                    width: widget.screenWidth * 0.45,
                    color: Color.fromRGBO(46, 46, 46, 1),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                  margin: EdgeInsets.all(10),
                  height: widget.screenHeight * 0.24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(46, 46, 46, 1),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
