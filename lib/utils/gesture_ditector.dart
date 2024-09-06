import 'package:flutter/material.dart';
import 'package:ui_practice/utils/animation/page_two.dart';

class GestureDitectorUi extends StatefulWidget {
  const GestureDitectorUi({super.key});

  @override
  State<GestureDitectorUi> createState() => _GestureDitectorState();
}

class _GestureDitectorState extends State<GestureDitectorUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Gesture Ditector'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Gesture Ditector...
          GestureDetector(
            onTap: () => Navigator.push(context, _createRoute()),
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(textAlign: TextAlign.center, 'Gesture Example'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const PageTwo(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
