import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';

import 'HomeContent.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void checkLocation() async {
    bool b = await Nearby().checkLocationEnabled();
    if (!b) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Alert'),
                content: Text(
                  'Please Enable Location Service',
                ),
                actions: [
                  FlatButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Nearby().enableLocationServices();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                elevation: 24.0,
              ),
          barrierDismissible: false);
    }
  }

  @override
  void initState() {
    super.initState();
    Nearby().askLocationAndExternalStoragePermission();
    checkLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeContent());
  }
}
