import 'package:flutter/material.dart';
import 'package:habitum3/src/components/liquid_swiper.dart';

import 'package:liquid_swipe/liquid_swipe.dart';

class Habits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: pages,
      enableSlideIcon: true,
      waveType: WaveType.liquidReveal,
      positionSlideIcon: 0,
      slideIconWidget: Icon(
        Icons.navigate_before,
        size: 50,
      ),
    );
  }
}
