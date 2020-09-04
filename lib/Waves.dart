import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Waves extends StatefulWidget {
  @override
  _WavesState createState() => _WavesState();
}

class _WavesState extends State<Waves> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _colorTween;
  Animation _colorTween2;
  Animation _colorTween3;
  Animation _widthheight;
  Animation _widthheight2;
  Animation _widthheight3;
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
    setUserState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _controller.repeat(reverse: true);
    _colorTween = ColorTween(
      begin: Color(0xFFf2e6ff),
      end: Color(0xFFbf80ff6),
    ).animate(_controller);
    _colorTween2 = ColorTween(
      begin: Color(0xFFf0e6ff),
      end: Color(0xFFb380ff),
    ).animate(_controller);
    _colorTween3 = ColorTween(
      begin: Color(0xFFe6e6ff),
      end: Color(0xFF9999ff),
    ).animate(_controller);

    _widthheight =
        new Tween<double>(begin: 120.0, end: 100.0).animate(_controller);
    _widthheight2 =
        new Tween<double>(begin: 220.0, end: 200.0).animate(_controller);
    _widthheight3 =
        new Tween<double>(begin: 320.0, end: 300.0).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xFF7A9BEE),
                    elevation: 0.0,
                    title: Text('AirShare',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18.0,
                            color: Colors.white)),
                    centerTitle: true,
                  ),
                  body: Container(
                    child: Center(
                      child: Container(
                          width: _widthheight3.value,
                          height: _widthheight3.value,
                          decoration: BoxDecoration(
                            color: Color(0xFF99b3ff),
                            borderRadius:
                                BorderRadius.all(Radius.circular(180.0)),
                          ),
                          child: Stack(children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: FlutterLogo(
                                size: 30,
                              ),
                            ),
                            Center(
                              child: Container(
                                width: _widthheight2.value,
                                height: _widthheight2.value,
                                decoration: BoxDecoration(
                                  color: Color(0xFFb3c6ff),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(180.0)),
                                ),
                                child: Center(
                                  child: Container(
                                      width: _widthheight.value,
                                      height: _widthheight.value,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFccd9ff),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(180.0)),
                                      ),
                                      child: Center(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                                image: DecorationImage(
                                                    image: AssetImage(heroTag),
                                                    fit: BoxFit.cover)),
                                            height: 50.0,
                                            width: 50.0),
                                      )),
                                ),
                              ),
                            ),
                          ])),
                    ),
                  )));
        });
  }
}
