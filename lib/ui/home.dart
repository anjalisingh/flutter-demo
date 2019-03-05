import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  void _onPress() => print("search tapped");

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> mList = new List();
    mList.add(new BottomNavigationBarItem(
        title: new Text("Home"),
        backgroundColor: Colors.amber,
        icon: new Icon(Icons.home)));
    mList.add(new BottomNavigationBarItem(
        title: new Text("Messages"),
        backgroundColor: Colors.amber,
        icon: new Icon(Icons.message)));
    mList.add(new BottomNavigationBarItem(
        title: new Text("Profile"),
        backgroundColor: Colors.amber,
        icon: new Icon(Icons.person)));

    _verticalDivider() => BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 0.5,
            ),
          ),
        );

    return new Scaffold(
        appBar: new AppBar(
            leading: Icon(Icons.menu, color: Colors.white),
            backgroundColor: Colors.greenAccent.shade700,
            title: new Text("Bazinggaaa"),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => debugPrint("send pressed")),
              new IconButton(icon: new Icon(Icons.search), onPressed: _onPress)
            ]),
        floatingActionButton: new FloatingActionButton(
            onPressed: () => debugPrint("Floating Action button Pressed"),
            backgroundColor: Colors.lightGreen,
            tooltip: 'Going up!',
            child: new Icon(Icons.call_missed)),
        body: new Container(
          alignment: Alignment.center,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new InkWell(
                child: new Text("Button"),
                onTap: () => debugPrint("Button Tapped"),
              )
            ],
          ),
        ),
        bottomNavigationBar: new Container(
            child: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.green,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.lightGreen)),
          ),
          child: new BottomNavigationBar(
            items: mList,
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            onTap: (int i) => debugPrint("Hey touched $i"),
          ),
        )));
  }
}
