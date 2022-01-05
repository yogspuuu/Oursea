import 'package:flutter/material.dart';
import 'package:oursea/animation/wave.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
    _controller.repeat(
      reverse: true,
      period: const Duration(seconds: 12),
    );

    animation = Tween<double>(begin: -100, end: 0).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ScreenUtil.init(
      BoxConstraints(
        maxWidth: size.width,
        maxHeight: size.height,
      ),
    );

    return Wave(animation: animation);

    // return Scaffold(
    //   backgroundColor: Colors.blue[50],
    //   body: SizedBox(
    //     height: size.height,
    //     child: Stack(
    //       clipBehavior: Clip.antiAlias,
    //       children: <Widget>[
    //         Container(
    //           padding: EdgeInsets.only(
    //             top: MediaQuery.of(context).padding.top * 2.5,
    //           ),
    //           child: Column(
    //             children: <Widget>[
    //               Expanded(
    //                 child: SizedBox(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: <Widget>[
    //                       Text(
    //                         'The Deep Sea',
    //                         style: TextStyle(
    //                           color: Colors.blue[800],
    //                           fontSize: ScreenUtil().setSp(32),
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                       Container(
    //                         height: ScreenUtil().setWidth(18),
    //                       ),
    //                       Text(
    //                         'Made with ❤ by Yoga Putra',
    //                         style: TextStyle(
    //                           color: Colors.blue[800],
    //                           fontSize: ScreenUtil().setSp(18),
    //                           fontWeight: FontWeight.normal,
    //                         ),
    //                         textAlign: TextAlign.center,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
