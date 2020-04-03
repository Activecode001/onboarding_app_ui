import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:onboardingappui/models/page.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff4d547a),
            //Color(0xff797ea1),
            Color(0xff2c335a),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
                itemCount: pageList.length,
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      AnimatedBuilder(
                          animation: _pageController,
                          builder: (context, child) {
                            var page = pageList[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(page.image),
                                Container(
                                  margin: EdgeInsets.only(left: 25),
                                  height: 120,
                                  child: Stack(
                                    children: <Widget>[
                                      Opacity(
                                        opacity: 0.10,
                                        child: GradientText(
                                          page.title,
                                          gradient: LinearGradient(
                                              colors: page.titleGradient),
                                          style: TextStyle(
                                            fontSize: 100,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 18.0,
                                          left: 18,
                                        ),
                                        child: GradientText(
                                          page.title,
                                          gradient: LinearGradient(
                                              colors: page.titleGradient),
                                          style: TextStyle(
                                            fontSize: 75,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 12,
                                    left: 45,
                                  ),
                                  child: Text(
                                    page.subTitle,
                                    style: TextStyle(
                                      fontSize: 30,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            );
                          })
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
