import 'package:flutter/material.dart';
import 'utils.dart';


///
/// bottom widget
///
class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: FlutterLogo(),
    );
  }

}


class GrowTransition extends StatelessWidget {

  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
        child: child,
      ),
    );
  }

}

///
/// Animate route
///
class AnimateGrow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _AnimateGrowState();
  }

}

class _AnimateGrowState extends State<AnimateGrow> with TickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _controller;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    CurvedAnimation curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _animation = Tween(begin: 0.0, end: 300.0).animate(curve);

    // start forward
    _controller.forward();
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GrowTransition(child: BottomWidget(), animation: _animation,);
  }

}