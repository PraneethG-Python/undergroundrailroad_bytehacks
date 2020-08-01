import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MySafehouse extends StatefulWidget {
  MySafehouse({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  SafehouseState createState() => SafehouseState();
}

class SafehouseState extends State<MySafehouse> {
  String contactInfo = "Contact Info";

  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text("Safehouse 0"),
      message: Text("Select any action "),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text(contactInfo),
          onPressed: () {
            // Rerenders this widget so that the change can be seen and not only the variable is changing
            setState(() {
              if (contactInfo.contains("\n")) {
                contactInfo = "Contact Info";
              } else {
                contactInfo = "Contact Info\nPhone Number: (546) 824-1924\nAddress: 2923 Garlen Ave";
              }
            });
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Housing Capacity: 13/30"),
          onPressed: () {},
        ),
        SnackBarPage()
      ],
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Activating GPS...'),
//            action: SnackBarAction(
//              label: 'Undo',
//              onPressed: () {
//                // Some code to undo the change.
//              },
//            ),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Calculate route'),
      ),
    );
  }
}