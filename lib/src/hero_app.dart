import 'package:flutter/material.dart';

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
        child: PhotoHero(
          photo: "images/small_new.jpg",
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Scaffold(
                appBar: AppBar(title: Text("Flipper page"),),
                body: Container(
                  color: Colors.lightBlueAccent,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: PhotoHero(
                    photo: "images/small_new.jpg",
                    width: 100.0,
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
    );
  }

}