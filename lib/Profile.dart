import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Profile> {
  String profilePicture = 'assets/ProfilePicture8.jpg';
  String userName = "";

  List<dynamic> avatars = [
    'assets/ProfilePicture1.jpg',
    'assets/ProfilePicture2.jpg',
    'assets/ProfilePicture3.jpg',
    'assets/ProfilePicture4.jpg',
    'assets/ProfilePicture5.jpg',
    'assets/ProfilePicture6.jpg',
    'assets/ProfilePicture7.jpg',
    'assets/ProfilePicture8.jpg',
    'assets/ProfilePicture9.jpg',
  ];

  void setUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('avatar', profilePicture);
    prefs.setString('name', userName);
    Navigator.of(context).pop();
  }

  void getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name');
    String picture = prefs.getString('avatar');
    if (name != null && picture != null) {
      setState(() {
        profilePicture = picture;
        userName = name;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                child: Stack(
              children: [
                Positioned(
                    top: 35,
                    child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                profilePicture,
                                width: 150,
                                height: 150,
                              ),
                              Container(
                                width: 150,
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      userName = value;
                                    });
                                  },
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      height: 1.4,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      hintText: 'Enter Name'),
                                ),
                              )
                            ]),
                        height: (MediaQuery.of(context).size.height / 3) - 40,
                        width: MediaQuery.of(context).size.width)),
                Positioned(
                    top: (MediaQuery.of(context).size.height / 3) + 5,
                    child: Container(
                        height:
                            (((MediaQuery.of(context).size.height) * 2) / 3) -
                                35,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 8.0),
                                  child: Center(
                                    child: Text('Select Avatar',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.black,
                                            fontFamily: 'Montserrat')),
                                  )),
                              Wrap(
                                children: [
                                  for (String a in avatars)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          profilePicture = a;
                                        });
                                      },
                                      child: Image.asset(
                                        a,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: GestureDetector(
                                    onTap: () {
                                      setUser();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(28.0),
                                            topRight: Radius.circular(28.0),
                                            bottomLeft: Radius.circular(28.0),
                                            bottomRight: Radius.circular(28.0),
                                          ),
                                          color: Color(0xFF7A9BEE)),
                                      height: 44.0,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      child: Center(
                                        child: Text('SAVE',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Montserrat')),
                                      ),
                                    ),
                                  )),
                            ]))),
              ],
            ))));
  }
}
