///
/// Workings with tab
///
import 'package:flutter/material.dart';
import 'utils.dart';


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
                /// tab 1 view
                Center(
                  child: Column(
                    children: <Widget>[
                      Text("This is tab1"),
                      MyForm(),

                    ],
                  ),
                ),
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
///
/// Create form widget
///
class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFormState();
  }

}

class _MyFormState extends State<MyForm> {

  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                // return error string if not valid input
                return "Please enter non empty string";
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              child: Text("Check"),
              onPressed: () {
                  // check form state
                  if (_formKey.currentState.validate()) {
                    // show snack bar
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
              },
            ),
          ),
        ],
      ),
    );
  }

}