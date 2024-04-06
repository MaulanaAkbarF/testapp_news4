import 'package:flutter/material.dart';

class FadeVerticalScrollView extends StatelessWidget {
  final Widget child;

  const FadeVerticalScrollView({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: Colors.green.withOpacity(0.5),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.transparent, Colors.black, Colors.black, Colors.transparent],
            stops: [0.0, 0.03, 0.97, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class AnimateFadeVerticalScrollView extends StatefulWidget {
  final Widget child;
  final double xStart;
  final double xEnd;
  final double yStart;
  final double yEnd;

  const AnimateFadeVerticalScrollView({
    super.key,
    required this.child,
    this.xStart = 0.0,
    this.xEnd = 0.0,
    this.yStart = 0.0,
    this.yEnd = 0.0,
  });

  @override
  FadeVerticalScrollViewState createState() => FadeVerticalScrollViewState();
}

class FadeVerticalScrollViewState extends State<AnimateFadeVerticalScrollView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _positionAnimation = Tween<Offset>(begin: Offset(widget.xStart, widget.yStart), end: Offset(widget.xEnd, widget.yEnd)).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: Colors.green.withOpacity(0.5),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.transparent,
              Colors.black,
              Colors.black,
              Colors.transparent
            ],
            stops: [0.0, 0.03, 0.97, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: _positionAnimation.value,
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: child,
                ),
              );
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}





