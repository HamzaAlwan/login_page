import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final Map data;

  WelcomePage({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: "logo",
                child: Container(
                  child: Icon(
                    Icons.lock_outline,
                    size: 100,
                    color: Color(0xffb8382c),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome ${data['id']}',
                          style: textStyle,
                        ),
                        Text(
                          'Location: ${data['selectedProject']}',
                          style: textStyle,
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const textStyle = TextStyle(
  color: Colors.black,
  fontSize: 28,
  fontWeight: FontWeight.bold,
  height: 2,
);
