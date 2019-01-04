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
                /// tab 2 view
                Center(
//                  child: MyListView(),
                  child: Column(
                    children: <Widget>[
                      Text("This is tab2"),
                      MyTextField(),
                      Expanded(
                        child: MyListView(),
                      ),
//                      MyListView(),
                    ],
                  ),
                ),
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

class MyListView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyListViewState();
  }

}

class _MyListViewState extends State<MyListView> {

  // For list view
  final List<String> items = List<String>.generate(10, (i) => "Item ${i+1}");

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, id) {
        final String item = items[id];

        return Dismissible(
          key: Key(item),
          onDismissed: (direction) {
            // Remove item
            setState(() {
              items.removeAt(id);
            });

            // show snack bar
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("$item is removed")));
          },
          background: Container(color: Colors.red,),
          child: ListTile(title: Text("$item"),),
        );
      },
      itemCount: items.length,
      itemExtent: 25.0,

    );
  }

}

class MyListView2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return MYListView2State();
  }

}

class MYListView2State extends State<MyListView2> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, id) {
          return ListTile(
            title: Text("Test item: $id"),
          );
      },
      itemCount: 3,
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
///
/// Build my custom text field widget
///
class MyTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTextFieldSate();
  }

}

class _MyTextFieldSate extends State<MyTextField> {

  final TextEditingController _controller = TextEditingController();




  @override
  void initState() {
    super.initState();
    // add text edit listener
    _controller.addListener(() {
      // handle text changed process
      Utils.showToast("New string: ${_controller.text}");
    });
  }


  @override
  void dispose() {
    super.dispose();
    // dispose text edit controller
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _controller,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Text("Hit me"),
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("I am hitted...")));
            },
          ),
          Container(
            height: 10.0,
            color: Colors.red,
          ),


        ],
      ),
    );
  }

}