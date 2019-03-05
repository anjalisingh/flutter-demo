import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child : new Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text(
                "Hello",
                textDirection:  TextDirection.ltr,
                style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                ),
              ),

              new Text(
                "Hello 2",
                textDirection:  TextDirection.rtl,
                style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                ),
              )

            ],
          ),

          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text(
                "Hello 1",
                textDirection:  TextDirection.ltr,
                style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                ),
              ),

              new Text(
                "Hello 3",
                textDirection:  TextDirection.rtl,
                style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800
                ),
              ),

              const Expanded(
                  child: const Text(
                    "Hello 4"
                  )
              )

            ],
          )

        ],
      )



//      child : new Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//
//        new Text(
//          "Hello",
//          textDirection:  TextDirection.ltr,
//          style: new TextStyle(
//              color: Colors.white,
//              fontWeight: FontWeight.w800
//          ),
//        ),
//
//        new Text(
//          "Hello 2",
//          textDirection:  TextDirection.rtl,
//          style: new TextStyle(
//              color: Colors.white,
//              fontWeight: FontWeight.w800
//          ),
//        )
//
//      ],
//    )

    );
  }


}