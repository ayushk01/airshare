import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
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
        new Tween<double>(begin: 150.0, end: 100.0).animate(_controller);
    _widthheight2 =
        new Tween<double>(begin: 250.0, end: 200.0).animate(_controller);
    _widthheight3 =
        new Tween<double>(begin: 350.0, end: 300.0).animate(_controller);
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
                          color: _colorTween.value,
                          borderRadius:
                              BorderRadius.all(Radius.circular(180.0)),
                        ),
                        child: Center(
                          child: Container(
                            width: _widthheight2.value,
                            height: _widthheight2.value,
                            decoration: BoxDecoration(
                              color: _colorTween2.value,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(180.0)),
                            ),
                            child: Center(
                              child: Container(
                                width: _widthheight.value,
                                height: _widthheight.value,
                                decoration: BoxDecoration(
                                  color: _colorTween3.value,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(180.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )));
        });
  }
}
