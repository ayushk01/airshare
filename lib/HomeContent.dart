import 'package:airshare/Profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'package:airshare/About.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var selectedCard = 'WEIGHT';
  String heroTag = 'assets/ProfilePicture1.jpg';
  String userName = 'User';

  void setUserState() async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name');
    String picture = prefs.getString('avatar');
    if (name != null && picture != null) {
      setState(() {
        heroTag = picture;
        userName = name;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setUserState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Color(0xFF7A9BEE),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                ),
              ),
              title: Text('AirShare',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18.0,
                      color: Colors.white)),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()))
                          .then((_) => setUserState());
                    },
                    child: Icon(
                      Icons.account_circle,
                    ),
                  ),
                )
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Center(
                      child: Text(
                        'AirShare',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/drawerBg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.home,
                      ),
                    ),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => About()))
                            .then((_) => setUserState());
                      },
                      child: Icon(
                        Icons.info,
                      ),
                    ),
                    title: Text('About'),
                    onTap: () {
                      Navigator.push(context,
                              MaterialPageRoute(builder: (context) => About()))
                          .then((_) => setUserState());
                    },
                  ),
                ],
              ),
            ),
            body: ListView(children: [
              Stack(children: [
                Container(
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent),
                Positioned(
                    top: 75.0,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.0),
                              topRight: Radius.circular(45.0),
                            ),
                            color: Colors.white),
                        height: MediaQuery.of(context).size.height - 100.0,
                        width: MediaQuery.of(context).size.width)),
                Positioned(
                    top: 15.0,
                    left: (MediaQuery.of(context).size.width / 2) - 75.0,
                    child: Hero(
                        tag: heroTag,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.0),
                                image: DecorationImage(
                                    image: AssetImage(heroTag),
                                    fit: BoxFit.cover)),
                            height: 150.0,
                            width: 150.0))),
                Positioned(
                    top: 170.0,
                    left: 15.0,
                    right: 25.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                            child: Text('Hello ' + userName + ' !',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(height: 80.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Select Files to Share',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                            height: 150.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                _buildInfoCard(
                                    'Images', Icon(Icons.insert_photo)),
                                SizedBox(width: 10.0),
                                _buildInfoCard('Videos', Icon(Icons.movie)),
                                SizedBox(width: 10.0),
                                _buildInfoCard(
                                    'Music', Icon(Icons.music_video)),
                                SizedBox(width: 10.0),
                                _buildInfoCard(
                                    'Docs', Icon(Icons.insert_drive_file)),
                                SizedBox(width: 10.0),
                                _buildInfoCard(
                                    'Apps',
                                    Icon(
                                      Icons.android,
                                    )),
                                SizedBox(width: 10.0),
                                _buildInfoCard('Others', Icon(Icons.style)),
                              ],
                            )),
                        SizedBox(height: 140.0),
                      ],
                    )),
                Positioned(
                    top: MediaQuery.of(context).size.height - 135,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28.0),
                            topRight: Radius.circular(28.0),
                          ),
                          color: Color(0xFF7A9BEE)),
                      height: 44.0,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text('Send / Recieve',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat')),
                      ),
                    )),
              ])
            ])));
  }

  void pickFiles(ext) {
    FilePicker.getMultiFile().then((values) => {print(values)});
  }

  Widget _buildInfoCard(String cardTitle, Icon icon) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
          pickFiles('none');
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:
                  cardTitle == selectedCard ? Colors.white : Color(0xFF7A9BEE),
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.grey.withOpacity(0.6)
                      : Colors.transparent,
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 100.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          color: cardTitle == selectedCard
                              ? Colors.grey.withOpacity(0.8)
                              : Colors.white,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 44.0),
                    child: IconButton(
                      icon: icon,
                      iconSize: 35.0,
                      onPressed: () => {},
                      color: cardTitle == selectedCard
                          ? Colors.grey.withOpacity(0.6)
                          : Colors.white.withOpacity(0.6),
                    ),
                  )
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
