///
/// Workings with tab
///
import 'package:flutter/material.dart';


class DemoTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Demo tab bar"),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("Tab1"),),
                  Tab(child: Text("Tab2"),),
                  Tab(child: Text("Tab3"),),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Text("This is tab1"),
                Text("This is tab2"),
                /// tab 3 view
                Center(
                  child: Column(
                    children: <Widget>[
                      Text("This is tab3"),
                      RaisedButton(
                        child: Text("Exit"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );

  }

}