import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:task_products/core/extension/context.dart';
import 'package:task_products/core/extension/data_type.dart';
import 'package:task_products/core/extension/widget.dart';
import 'package:task_products/core/resources_manager/strings.dart';
import 'package:task_products/core/resources_manager/values.dart';

import '../resources_manager/color.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppSize.appSize24,
        width: AppSize.appSize24,
        child: AnimatedDotsLoader(),
      ),
    );
  }
}

class CircularLoadingIndicator extends StatelessWidget {
  const CircularLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: AnimatedDotsLoader());
  }
}

//shimmer loadin list
class ListLoading extends StatelessWidget {
  const ListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: AnimatedDotsLoader());
  }
}

class LoadinContent extends StatelessWidget {
  final String message;
  const LoadinContent({super.key, this.message = "Loading..."});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 100, width: context.width),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [AnimatedDotsLoader()],
      ),
    );
  }
}

// button load more

class LoadMoreData extends StatelessWidget {
  final Function() onTap;
  const LoadMoreData({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: [
            const Icon(
              Icons.refresh,
              color: ColorManager.primaryColor,
              size: 20,
            ),
            AppSize.appSize5.widthSizedBox,
            "Load More".toText(
              context,
              color: ColorManager.primaryColor,
              fontSize: AppSize.appSize14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
          ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
          .toSizedBox(height: 40, width: 150),
    );
  }
}

class DottedLoading extends StatefulWidget {
  final Color loadingColor;
  const DottedLoading({
    super.key,
    this.loadingColor = ColorManager.primaryColor,
  });

  @override
  State<DottedLoading> createState() => _DottedLoadingState();
}

class _DottedLoadingState extends State<DottedLoading> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDotsLoader();
  }
}

class DottedPainterFb extends CustomPainter {
  final double percentage;
  final Color dotColor;
  final Color currentDotColor;
  final int numDots;
  final int currentDotNum;
  final double dotWidth;

  DottedPainterFb({
    required this.dotColor,
    required this.currentDotColor,
    required this.percentage,
    required this.numDots,
    required this.dotWidth,
    required this.currentDotNum,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double smallestSide = Math.min(size.width, size.height);
    final double radius = (smallestSide / 2 - dotWidth / 2) - dotWidth / 2;
    final Offset centerPoint = Offset(size.width / 2, size.height / 2);

    final dotPaint =
        Paint()
          ..style = PaintingStyle.fill
          ..color = dotColor;

    CircleData myCircle = CircleData(radius: radius, totalNumOfDots: numDots);
    for (var i = 0; i < numDots; i++) {
      if (i == currentDotNum) {
        dotPaint.color = currentDotColor;
      } else {
        dotPaint.color = dotColor;
      }
      canvas.drawCircle(
        centerPoint - myCircle.calcDotOffsetFromCenter(i, radius),
        dotWidth,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(DottedPainterFb oldDelegate) =>
      oldDelegate.currentDotNum != currentDotNum ? true : false;
}

//  Calculats the offst each dot based on the total number of dots
class CircleData {
  int totalNumOfDots;
  double radius;

  CircleData({required this.totalNumOfDots, required this.radius});

  Offset calcDotOffsetFromCenter(int dotNumber, double radius) {
    return Offset(_calcDotX(dotNumber), _calcDotY(dotNumber));
  }

  double _calcDotAngle(int currentDotNumber) {
    return -currentDotNumber * _calcRadiansPerDot();
  }

  double _calcRadiansPerDot() {
    return 2 * Math.pi / (totalNumOfDots);
  }

  double _calcDotX(int thisDotNum) {
    return radius * Math.sin(_calcDotAngle(thisDotNum));
  }

  double _calcDotY(int thisDotNum) {
    return radius * Math.cos(_calcDotAngle(thisDotNum));
  }
}

class AnimatedDotsLoader extends StatefulWidget {
  final Color color;

  const AnimatedDotsLoader({super.key, this.color = ColorManager.primaryColor});
  @override
  _AnimatedDotsLoaderState createState() => _AnimatedDotsLoaderState();
}

class _AnimatedDotsLoaderState extends State<AnimatedDotsLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    )..repeat();

    _animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );

    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 0.8, curve: Curves.easeInOut),
      ),
    );

    _animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _size = 15.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation1,
            builder: (context, child) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                width: _size * _animation1.value,
                height: _size * _animation1.value,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animation2,
            builder: (context, child) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                width: _size * _animation2.value,
                height: _size * _animation2.value,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animation3,
            builder: (context, child) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                width: _size * _animation3.value,
                height: _size * _animation3.value,
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
