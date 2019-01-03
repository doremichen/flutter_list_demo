import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/utils.dart';
import 'src/dynamic_list.dart';
import 'src/navigation_btn_demo.dart';
import 'src/custom_scroll_view.dart';


void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,
       DeviceOrientation.portraitDown]
  ).then((_) {
    runApp(new MyApp());
  });

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo list',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // define roue
      routes: {
        "simple list demo": (context) => SimpleLitViewRoute(),
        "listview seperator demo": (context) => ListViewSeperatorRoute(),
        "complex listview demo": (context) => ComplexListViewRoute(),
        "dynamic list view demo": (context) => DynamicListRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              child: Text("Test toast"),
              onPressed: () {
                Utils.showToast("Hi Adam...");
              },
            ),
            RaisedButton(
              child: Text("List demo1"),
              onPressed: () {
                  Navigator.pushNamed(context, "simple list demo");
              },
            ),
            RaisedButton(
              child: Text("List demo2"),
              onPressed: () {
                  Navigator.pushNamed(context, "listview seperator demo");
              },
            ),
            RaisedButton(
              child: Text("List demo3"),
              onPressed: () {
                Navigator.pushNamed(context, "complex listview demo");
              },
            ),
            RaisedButton(
              child: Text("Dynamic list view"),
              onPressed: () {
                Navigator.pushNamed(context, "dynamic list view demo");
              },
            ),
            RaisedButton(
              child: Text("Show alert dialog"),
              onPressed: () {
                Utils.showInfoDialog(context, "I am customize dialog..");
              },
            ),
            RaisedButton(
              child: Text("demo navigationbar"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DemoNavigationBar()));
              },
            ),
            RaisedButton(
              child: Text("demo custom scroll view"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DemoCustomScrollView()));
              },
            ),
            SnackBarPage(),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,    //avoid button overflow
    );
  }

  @override
  void initState() {
    super.initState();


  }
}

///
/// Show snackbar widget
///
class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("demo Snack bar"),
        onPressed: () {

          SnackBar _snackBar = SnackBar(
            content: Text("I am snackBar..."),
            action: SnackBarAction(
                label: "Action",
                onPressed: () {
                  Utils.showToast("Sanck bar action....");
                }
            ),
          );


          Scaffold.of(context).showSnackBar(_snackBar);
        },
      ),
    );
  }

}

class Todo {
  final String title;
  final String description;
  String ret;

  Todo({this.title, this.description, this.ret});
}

///
/// Detail view
///
class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key key, @required this.todo}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Title: ${todo.title}"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300.0,
              height: 100.0,
              child: Text("Info: ${todo.description}",
                style: TextStyle(fontSize: 24),
                softWrap: true,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text("Back"),
                onPressed: (){
                  todo.ret = "I am back... from ${todo.title}";
                  Navigator.pop(context, todo);
              },),
            ),
          ],
        ),
      ),

    );
  }

}
class SimpleLitViewRoute extends StatelessWidget {

  final todos = List<Todo>.generate(10, (i) => Todo(title: "Todo $i", description: "Todo description: Hello $i item"));

  List<String> itemName = ["Test1", "Test2", "Test3"];
  // TextField controller
  TextEditingController _controller = TextEditingController();

  // show result
  String _retstr;

  Future<void> _goToNext(BuildContext context, int position) async {
    Future<Todo> data = Navigator.push(context, MaterialPageRoute(builder:
        (context) => DetailScreen(todo: todos[position],)));

    data.then((value) {
      _retstr = value.ret;
      Utils.showToast(_retstr);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo simple list"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                Text("One", style: TextStyle(fontSize: 30),),
                Text("Two", style: TextStyle(fontSize: 30),),
                Text("Three", style: TextStyle(fontSize: 30),),
              ],
            ),
          ),
          Container(
            width: 300.0,
            height: 10.0,
            color: Colors.red,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, position) {

              // click listener
              return GestureDetector(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(todos[position].title, style: TextStyle(fontSize: 24.0),),
                  ),
                ),
                onTap: () {
                  Utils.showToast("item $position is clicked...");
                  _goToNext(context, position);
//                  var ret = Navigator.push(context, MaterialPageRoute(builder:
//                      (context) => DetailScreen(todo: todos[position],)));
                },
              );

             },
            ),
          ),

        ],
      )

    );
  }

}

class ListViewSeperatorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo listview seperator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, position) {
                return Card(
                  child: Padding(padding: const EdgeInsets.all(10.0),
                    child: Text("Item: $position", style: TextStyle(fontSize: 22.0),),),
                );
              },
              separatorBuilder: (context, position) {
                return Divider(height: 16.0, color: Colors.black, indent: 5.0,);
              },
              itemCount: 10,
            ),
          ),
          Container(
            width: 350.0,
            height: 10.0,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            color: Colors.red,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, position) {
                  return ListTile(title: Text("$position"),

                  onTap: (){

                  },);
              },
              itemCount: 20,
            ),
          ),
        ],
      )
    );
  }

}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

class ComplexListViewRoute extends StatelessWidget {

  // prepare item
  final List<ListItem> items = List<ListItem>.generate(10,
  (i) => i%5 == 0? HeadingItem("Heading $i"): MessageItem("Sender $i", "Message $i"),);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( title: Text("Demo complex listView"),),
      body: ListView.separated(
          itemBuilder: (context, index) {
              final item = items[index];

              if (item is HeadingItem) {
                return Card(
                  color: Colors.yellow,
                  child: Text(item.heading, style: Theme.of(context).textTheme.headline,),
                );
              } else if (item is MessageItem) {
                  return ListTile(
                    title: Text(item.sender),
                    subtitle: Text(item.body),
                    onTap: (){
                        Utils.showToast("Hit me...I am ${item.sender}");
                    },
                  );
              }
          },
          separatorBuilder: (context, index) {
            return Divider( height: 10.0, color: Colors.red,);
          },
          itemCount: items.length,
      ),
    );
  }
}