import 'package:flutter/material.dart';
import 'package:sporter_turf_booking/utils/global_colors.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = MyColors.appColor;
    paint.style = PaintingStyle.fill; 

    var path = Path();

    path.moveTo(0,70 /*size.height * 0.10*/);
    path.quadraticBezierTo(
        size.width *0.25, /*size.height *0.20*/140, size.width*0.5,90 /*size.height*0.12*/);
    path.quadraticBezierTo(
        size.width *0.75, /*size.height *0.05*/35, size.width, 110/*size.height * 0.15*/);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
