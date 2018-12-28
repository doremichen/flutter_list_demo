///
/// Dynamic list view demo
///
import 'package:flutter/material.dart';

import 'utils.dart';

class DynamicListRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DynamicListRouteSate();
  }

}

class _DynamicListRouteSate extends State<DynamicListRoute> {

  List<String> items = [];
  // Text edit controller
  TextEditingController _editItemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Demo dynamic list"),),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _editItemController,
                onSubmitted: (text) {
                  items.add(text);
                  _editItemController.clear();
                  // Update list view
                  setState(() {

                  });
                },

              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(color: Colors.red,),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Text(items[index], style: TextStyle(fontSize: 24),),
                              onTap: () {
                                Utils.showToast("the item ${items[index]} is clicked");
                              },
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );

  }

}