import 'package:flutter/material.dart';

class CurveCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path p=Path();
    p.lineTo(0, 4*size.height/5);
    p.quadraticBezierTo(1*size.width/4, size.height, 1*size.width/2, 4*size.height/5);
    p.quadraticBezierTo(3*size.width/4, 3*size.height/5, size.width, 4*size.height/5);
    p.lineTo(size.width, 0);
    p.close();



  return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }


}