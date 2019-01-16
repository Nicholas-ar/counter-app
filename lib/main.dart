import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de pessoas",
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode entrar!";

  void _changePeople(int delta){
    setState(() {
      _people+=delta;

      if(_people < 0){
        _infoText = "wat";
      }
      else if(_people == 25){
        _infoText = "Capacidade limite!";
      }
      else if(_people > 25){
        _infoText = "Capacidade excedida!";
      }
      else {
        _infoText = "Pode entrar!";
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/food.jpg", fit: BoxFit.cover, height: 720),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}

