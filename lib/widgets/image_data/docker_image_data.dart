import 'package:authencicationtest/models/docker_images.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class ImagesData extends StatelessWidget {
  final List<Images> imagesdata;
  ImagesData({Key key, this.imagesdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: imagesdata.map((e) {
        return ListTile(
          leading: IconButton(
              icon: Icon(Icons.content_copy),
              color: Colors.amber[900],
              onPressed: () {
                FlutterClipboard.copy(e.imageName[0].toString()).then((value) {
                  final snackBar = SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                      'Copied to Clipboard',
                      style: TextStyle(
                          color: Colors.amber[900],
                          fontWeight: FontWeight.bold),
                    ),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                });
              }),
          title: Text(
            e.imageName[0].toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            //maxLines: 1,
            //overflow: TextOverflow.clip,
          ),
        );
      }).toList(),
    );
  }
}
