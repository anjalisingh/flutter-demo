import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../util/utils.dart' as util;
import 'dart:async';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {

  String _enterCity;
  Future goToNextScreen(BuildContext context) async {
    Map results = await Navigator
        .of(context)
        .push(MaterialPageRoute<Map> (builder: (BuildContext context) {
          return new ChangeCity();
    }));

    if(results != null && results.containsKey('enter')) {
      _enterCity = results['enter'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Klimatic'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {goToNextScreen(context);},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          new Center(
              child: Image.asset(
                'images/umbrella.png',
                width: 490.0,
                height: 1200.0,
                fit: BoxFit.fill,
              )),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: Text('${_enterCity == null ? util.defaultCity : _enterCity}', style: cityStyle()),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset('images/light_rain.png'),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(30.0, 290.0, 0.0, 0.0),
              child: tempWidget(_enterCity)
          ),
        ],
      ),
    );
  }

  Future<Map> getWeather(String appKey, String city) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appId=${util
        .appId}&units=imperial';

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }

  Widget tempWidget(String city) {
    return FutureBuilder(
        future: getWeather(util.appId, city == null ? util.defaultCity : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapShot) {
          if (snapShot.hasData) {
            Map content = snapShot.data;
            return new Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      content['main']['temp'].toString(),
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 49.9,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),

                    ),

                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        }
    );
  }
}

class ChangeCity extends StatelessWidget {

  TextEditingController _cityFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Change City"),
        centerTitle: true,
      ),

      body: Stack(
          children: <Widget>[
          Center(
            child:
                Image.asset('images/white_snow.png',
              width: 490.0,
              height: 1200.0,
              fit: BoxFit.fill
          ),
          ),

          ListView(
            children: <Widget>[
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter city",

                  ),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),

              ListTile(
                title: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'enter' : _cityFieldController.text
                    }
                    );
                  }
                    ,
                  textColor: Colors.white70,
                  color: Colors.redAccent,
                  child: Text("Get Weather"),
                ),
              ),
            ],
          )
          ],
    )
    ,
    );
  }
}


TextStyle tempStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 49.9,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
}

TextStyle cityStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 22.9, fontStyle: FontStyle.italic);
}
