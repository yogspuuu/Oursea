import 'package:flutter/material.dart';

class Wave extends AnimatedWidget {
  final Animation<double> animation;

  Wave({
    Key? key,
    required this.animation,
  }) : super(key: key, listenable: animation);

  final Color backgroundColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Text(
          'Wave Animation in Flutter',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30.0),
        ),
        const Padding(
          padding: EdgeInsets.all(28.0),
          child: FlutterLogo(size: 200.0),
        ),
        Expanded(
          child: Stack(children: [
            Positioned(
              bottom: 0,
              right: animation.value,
              child: ClipPath(
                clipper: WaveBottom(),
                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                    color: backgroundColor,
                    width: 1000,
                    height: 200,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: animation.value,
              child: ClipPath(
                clipper: WaveBottom(),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: backgroundColor,
                    width: 1000,
                    height: 200,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class WaveBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 40.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 40.0);

    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            0.0,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      } else {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            size.height - 120,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      }
    }

    path.lineTo(0.0, 40.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
