import 'package:flutter/material.dart';
import 'dart:ui';


class TextBackgroudBlur {

 
   buildBlur({
      required Widget child,
      double sigmaX = 10,
      double sigmaY = 10,
    }) => ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX,sigmaY: sigmaY),
        child: child,
        ),
    );

}
