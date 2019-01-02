///
/// This is navigationbar demo
///
import 'package:flutter/material.dart';

class DemoNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoNavigationBarState();
  }

}

class _DemoNavigationBarState extends State<DemoNavigationBar> {

  int _selectId = 1;

  final _buttons = [
    Text("Index 0: Home"),
    Text("Index 1: Office"),
    Text("Index 2: Others"),
  ];

  bool _visible = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Demo navigation bar"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buttons.elementAt(_selectId),
            Container(
              height: 8.0,
              color: Colors.red,
            ),
            Center(
              child: AnimatedOpacity(
                opacity: _visible? 1.0: 0.0,
                duration: Duration(seconds: 3),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 8.0,
              color: Colors.red,
            ),
          ],

        )
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Office")),
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Others")),
          ],
          currentIndex: _selectId,
          fixedColor: Colors.orangeAccent,
          onTap: (id) {
            setState(() {
              _selectId = id;
            });
          },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer header"),
              decoration: BoxDecoration(
                  color: Colors.orange[200],
                  border: Border.all(
                    color: Colors.black,
                    width: 8.0,
                  )
              ),
            ),
            ClipRect(
              child: ListTile(
                leading: Icon(Icons.change_history),
                title: Text("Change history"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            ClipRect(
              child: ListTile(
                leading: Icon(Icons.change_history),
                title: Text("Change history"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
        tooltip: "Tool Opacity",
        child: Icon(Icons.flip),
      ),

    );
  }

}