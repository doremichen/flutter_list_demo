import 'package:flutter/material.dart';

import 'dart:math';

class PhotoHero extends StatelessWidget {

  final String photo;
  final VoidCallback onTap;
  final double width;

  PhotoHero({Key key, this.photo, this.onTap, this.width}):super(key: key);


  @override
  Widget build(BuildContext context) {

    return SizedBox(
        width: width,
        child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.asset(photo, fit: BoxFit.contain,),
            ),
          ),
        ),
    );
  }

}


class Photo extends StatelessWidget {

  final String photo;
  final VoidCallback onTap;

  Photo({Key key, this.photo, this.onTap}):super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(photo, fit: BoxFit.contain,),
      ),
    );
  }

}

class RadioExpansion extends StatelessWidget {

  final double maxRadius;
  final double clipRectSize;
  final Widget child;

  RadioExpansion({Key key, this.maxRadius, this.child}): clipRectSize = 2.0*(maxRadius), super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }

}

///
/// Animate route
///
class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo hero animation"),
      ),
      body: Center(
        child: Photo(
          photo: "images/small_new.jpg",
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(title: Text("Flipper page"),),
                body: Container(
                  color: Colors.lightBlueAccent,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Photo(
                    photo: "images/small_new.jpg",
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
//      body: Center(
//        child: PhotoHero(
//          photo: "images/small_new.jpg",
//          width: 300.0,
//          onTap: () {
//            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//              return Scaffold(
//                appBar: AppBar(title: Text("Flipper page"),),
//                body: Container(
//                  color: Colors.lightBlueAccent,
//                  padding: const EdgeInsets.all(16.0),
//                  alignment: Alignment.center,
//                  child: PhotoHero(
//                    photo: "images/small_new.jpg",
//                    width: 100.0,
//                    onTap: () {
//                      Navigator.of(context).pop();
//                    },
//                  ),
//                ),
//              );
//            }));
//          },
//        ),
//      ),
    );
  }

}