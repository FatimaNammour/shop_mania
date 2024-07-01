import 'package:flutter/material.dart';

class AppSliderShape extends SliderComponentShape {
  final double thumbRadius;

  const AppSliderShape({required this.thumbRadius});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.purple;

    // draw icon with text painter
    const iconData = Icons.circle;
    final TextPainter textPainter =
        TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
          fontSize: thumbRadius * 1.5,
          fontFamily: iconData.fontFamily,
          color: sliderTheme.thumbColor,
        ));
    textPainter.layout();

    final Offset textCenter = Offset(center.dx - (textPainter.width / 2),
        center.dy - (textPainter.height / 2));

    // const cornerRadius = 2.0;
    // draw the background shape here..
    // canvas.drawRRect(
    //   RRect.fromRectXY(Rect.fromCenter(center: center, width: 30, height: 20),
    //       cornerRadius, cornerRadius),
    //   paint,
    // );

    canvas.drawCircle(
        Offset(center.dx - (textPainter.width / 20),
            center.dy - (textPainter.height / 20)),
        10,
        paint);
    textPainter.paint(canvas, textCenter);
  }
}
