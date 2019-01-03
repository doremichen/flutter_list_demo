///
/// Use the SliverAppBar, SliverList, SliverGrid to compose the custom scroll view
///
import 'package:flutter/material.dart';
import 'utils.dart';

class DemoCustomScrollView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoCustomScrollViewState();
  }

}

class _DemoCustomScrollViewState extends State<DemoCustomScrollView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //SliverAppBar
          SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: const Text("Sliver appBar", style: TextStyle(color: Colors.black54),),
              centerTitle: true,
              background: const Image(
                image: const AssetImage("images/small_new.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                tooltip: "Search",
                onPressed: () {
                  Utils.showToast("Search action....");
                },
              ),
            ],
          ),

          /// Sliver list
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
                  child: Text(
                    "SliverFixedExtentList",
                    textAlign: TextAlign.center,
                  ),
                );
              },
              childCount: 1,
            ),
            itemExtent: 150.0,
          ),

          /// Sliver grid
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, id) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (id % 9)],
                  child: Text("Grid item $id"),
                );
              },
              childCount: 18,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180.0,

            ),
          ),

        ],

      ),
    );
  }

}