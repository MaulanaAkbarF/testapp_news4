import 'package:flutter/material.dart';

import '../Style/Styleapp.dart';
import '../Style/Themeapp.dart';

class ArrowButton extends StatefulWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String labelButton;
  final EdgeInsets? margin;
  final EdgeInsets? marginButtonLabel;
  final double spaceIcon;
  final MainAxisAlignment mainAxisAlignment;
  final double? width;
  final double? height;
  final Color? containerColor;
  final Color containerColorStart;
  final Color containerColorEnd;
  final double containerOpacity;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final double borderOpacity;
  final double borderSize;
  final TextAlign textAlign;
  final TextStyle? labelButtonStyle;
  final Function() onTap;

  const ArrowButton({
    super.key,
    this.labelButton = 'Accept',
    this.prefixIcon,
    this.suffixIcon,
    this.spaceIcon = 10,
    this.margin,
    this.marginButtonLabel,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.width,
    this.height,
    this.containerColor,
    this.containerColorStart = Colors.transparent,
    this.containerColorEnd = Colors.transparent,
    this.containerOpacity = 1.0,
    this.borderRadius,
    this.borderColor,
    this.borderOpacity = 1.0,
    this.borderSize = 1,
    this.textAlign = TextAlign.start,
    this.labelButtonStyle,
    required this.onTap,
  });

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Semantics(
      label: 'This is a Button',
      child: Container(
        margin: widget.margin,
        width: widget.width,
        height: widget.height,
        constraints: const BoxConstraints(minHeight: 30),
        decoration: BoxDecoration(
          gradient: (widget.containerColorStart != Colors.transparent && widget.containerColorEnd != Colors.transparent)
              ? LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [widget.containerColorStart, widget.containerColorEnd],
          )
              : null,
          color: (widget.containerColorStart == Colors.transparent || widget.containerColorEnd == Colors.transparent)
              ? widget.containerColor?.withOpacity(widget.containerOpacity)
              : null,
          borderRadius: widget.borderRadius,
          border: Border.all(
            color: widget.borderColor?.withOpacity(widget.borderOpacity) ?? Colors.transparent,
            width: widget.borderSize,
          ),
        ),
        child: ClipRRect(
          borderRadius: widget.borderRadius ?? BorderRadius.zero,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.6),
              highlightColor: Colors.blue.withOpacity(0.6),
              onTap: () {
                widget.onTap();
              },
              child: Padding(
                padding: widget.marginButtonLabel ?? EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: widget.mainAxisAlignment,
                  children: [
                    widget.prefixIcon ?? Container(),
                    SizedBox(width: widget.spaceIcon),
                    Expanded(
                      child: Text(
                        widget.labelButton,
                        textAlign: widget.textAlign,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: widget.labelButtonStyle ?? StyleApp.largeTextStyle.copyWith(color: themeColors.textColorRegular),
                      ),
                    ),
                    SizedBox(width: widget.spaceIcon),
                    widget.suffixIcon ?? Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressButton extends StatefulWidget {
  final String labelButton;
  final String labelProgress;
  final EdgeInsets? margin;
  final EdgeInsets? marginButtonLabel;
  final double? width;
  final double? height;
  final Color? containerColor;
  final double containerOpacity;
  final double containerRadius;
  final Color? borderColor;
  final double borderOpacity;
  final double borderRadius;
  final double borderSize;
  final TextAlign textAlign;
  final TextStyle? labelButtonStyle;
  final Function onTap;
  final Icon? icon;

  const ProgressButton({
    super.key,
    this.labelButton = 'Accept',
    this.labelProgress = 'Loading',
    this.margin,
    this.marginButtonLabel,
    this.width,
    this.height,
    this.containerColor,
    this.containerOpacity = 1.0,
    this.containerRadius = 0,
    this.borderColor,
    this.borderOpacity = 1.0,
    this.borderRadius = 0,
    this.borderSize = 1,
    this.textAlign = TextAlign.center,
    this.labelButtonStyle,
    required this.onTap,
    this.icon,
  });

  @override
  ProgressButtonState createState() => ProgressButtonState();
}

class ProgressButtonState extends State<ProgressButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return GestureDetector(
      onTap: () async {
        if (!_loading) {
          setState(() {
            _loading = true;
          });

          await Future.delayed(const Duration(seconds: 1));
          bool success = await widget.onTap();

          setState(() {
            _loading = false;
          });

          if (success == false) {
            return;
          }
        }
      },
      child: Container(
        margin: widget.margin,
        width: widget.width,
        height: widget.height,
        constraints: const BoxConstraints(minHeight: 30),
        decoration: BoxDecoration(
          color: widget.containerColor?.withOpacity(widget.containerOpacity),
          borderRadius: BorderRadius.circular(widget.containerRadius),
          border: Border.all(
            color: widget.borderColor?.withOpacity(widget.borderOpacity) ?? Colors.transparent,
            width: widget.borderSize,
          ),
        ),
        child: Padding(
          padding: widget.marginButtonLabel ?? EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_loading)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              if (_loading)
                const SizedBox(width: 10),
              if (!_loading)
                widget.icon ?? Container(),
              if (!_loading)
                const SizedBox(width: 10),
              Flexible(
                child: Text(
                  _loading ? widget.labelProgress : widget.labelButton,
                  textAlign: widget.textAlign,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: widget.labelButtonStyle ?? StyleApp.largeTextStyle.copyWith(color: themeColors.textColorRegular),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimateProgressButton extends StatefulWidget {
  final String labelButton;
  final String labelProgress;
  final EdgeInsets? margin;
  final EdgeInsets? marginButtonLabel;
  final MainAxisAlignment mainAxisAlignment;
  final double? width;
  final double? height;
  final Color? containerColor;
  final Color containerColorStart;
  final Color containerColorEnd;
  final double containerOpacity;
  final double containerRadius;
  final Color? borderColor;
  final double borderOpacity;
  final double borderRadius;
  final double borderSize;
  final double xPosition;
  final double yPosition;
  final TextAlign textAlign;
  final TextStyle? labelButtonStyle;
  final Function onTap;
  final Icon? icon;

  const AnimateProgressButton({
    super.key,
    this.labelButton = 'Accept',
    this.labelProgress = 'Loading',
    this.margin,
    this.marginButtonLabel,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.width,
    this.height,
    this.containerColor,
    this.containerColorStart = Colors.transparent,
    this.containerColorEnd = Colors.transparent,
    this.containerOpacity = 1.0,
    this.containerRadius = 0,
    this.borderColor,
    this.borderOpacity = 1.0,
    this.borderRadius = 0,
    this.borderSize = 1,
    this.xPosition = 0.0,
    this.yPosition = -5.0,
    this.textAlign = TextAlign.center,
    this.labelButtonStyle,
    required this.onTap,
    this.icon,
  });

  @override
  AnimateProgressButtonState createState() => AnimateProgressButtonState();
}

class AnimateProgressButtonState extends State<AnimateProgressButton> with SingleTickerProviderStateMixin {
  bool _loading = false;
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(_controller!);
    _positionAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(widget.xPosition, widget.yPosition)).animate(_controller!);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Semantics(
      label: 'This is a Button',
      child: Container(
        margin: widget.margin,
        width: widget.width,
        height: widget.height,
        constraints: const BoxConstraints(minHeight: 30),
        decoration: BoxDecoration(
          gradient: (widget.containerColorStart != Colors.transparent && widget.containerColorEnd != Colors.transparent)
              ? LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [widget.containerColorStart, widget.containerColorEnd],
          )
              : null,
          color: (widget.containerColorStart == Colors.transparent || widget.containerColorEnd == Colors.transparent)
              ? widget.containerColor?.withOpacity(widget.containerOpacity)
              : null,
          borderRadius: BorderRadius.circular(widget.containerRadius),
          border: Border.all(
            color: widget.borderColor?.withOpacity(widget.borderOpacity) ?? Colors.transparent,
            width: widget.borderSize,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.containerRadius),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.6),
              highlightColor: Colors.blue.withOpacity(0.6),
              onTap: () async {
                if (!_loading) {
                  setState(() {
                    _loading = true;
                  });
                  bool success = await widget.onTap();
                  _controller!.reverse();

                  _controller!.forward();
                  await Future.delayed(const Duration(milliseconds: 600));
                  _controller!.reverse();

                  setState(() {
                    _loading = false;
                  });

                  if (success == false) {
                    return;
                  }
                }
              },
              child: Padding(
                padding: widget.marginButtonLabel ?? EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: widget.mainAxisAlignment,
                  children: [
                    if (_loading)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    if (_loading)
                      const SizedBox(width: 10),
                    if (!_loading)
                      AnimatedBuilder(
                        animation: _controller!,
                        builder: (BuildContext context, Widget? child) {
                          return Opacity(
                            opacity: _opacityAnimation!.value,
                            child: Transform.translate(
                              offset: _positionAnimation!.value,
                              child: child,
                            ),
                          );
                        },
                        child: widget.icon ?? Container(),
                      ),
                    if (!_loading && widget.icon != null)
                      const SizedBox(width: 10),
                      Flexible(
                        child: AnimatedBuilder(
                          animation: _controller!,
                          builder: (BuildContext context, Widget? child) {
                            return Opacity(
                              opacity: _opacityAnimation!.value,
                              child: Transform.translate(
                                offset: _positionAnimation!.value,
                                child: Text(
                                  _loading ? widget.labelProgress : widget.labelButton,
                                  textAlign: widget.textAlign,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: widget.labelButtonStyle ?? StyleApp.largeTextStyle.copyWith(color: themeColors.textColorRegular),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimateFlagButton extends StatefulWidget {
  final String labelButton;
  final String labelProgress;
  final EdgeInsets? margin;
  final EdgeInsets? marginButtonLabel;
  final double? width;
  final double? height;
  final Color? containerColor;
  final Color containerColorStart;
  final Color containerColorEnd;
  final double containerOpacity;
  final double containerRadius;
  final Color? borderColor;
  final double borderOpacity;
  final double borderRadius;
  final double borderSize;
  final double xPosition;
  final double yPosition;
  final TextAlign textAlign;
  final TextStyle? labelButtonStyle;
  final Function onTap;
  final Image? image;

  const AnimateFlagButton({
    super.key,
    this.labelButton = 'Accept',
    this.labelProgress = 'Loading',
    this.margin,
    this.marginButtonLabel,
    this.width,
    this.height,
    this.containerColor,
    this.containerColorStart = Colors.transparent,
    this.containerColorEnd = Colors.transparent,
    this.containerOpacity = 1.0,
    this.containerRadius = 0,
    this.borderColor,
    this.borderOpacity = 1.0,
    this.borderRadius = 0,
    this.borderSize = 1,
    this.xPosition = 0.0,
    this.yPosition = -5.0,
    this.textAlign = TextAlign.center,
    this.labelButtonStyle,
    required this.onTap,
    this.image,
  });

  @override
  AnimateFlagButtonState createState() => AnimateFlagButtonState();
}

class AnimateFlagButtonState extends State<AnimateFlagButton> with SingleTickerProviderStateMixin {
  bool _loading = false;
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(_controller!);
    _positionAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(widget.xPosition, widget.yPosition)).animate(_controller!);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Semantics(
      label: 'This is a Button',
      child: Container(
        margin: widget.margin,
        width: widget.width,
        height: widget.height,
        constraints: const BoxConstraints(minHeight: 30),
        decoration: BoxDecoration(
          gradient: (widget.containerColorStart != Colors.transparent && widget.containerColorEnd != Colors.transparent)
              ? LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [widget.containerColorStart, widget.containerColorEnd],
          )
              : null,
          color: (widget.containerColorStart == Colors.transparent || widget.containerColorEnd == Colors.transparent)
              ? widget.containerColor?.withOpacity(widget.containerOpacity)
              : null,
          borderRadius: BorderRadius.circular(widget.containerRadius),
          border: Border.all(
            color: widget.borderColor?.withOpacity(widget.borderOpacity) ?? Colors.transparent,
            width: widget.borderSize,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.containerRadius),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.6),
              highlightColor: Colors.blue.withOpacity(0.6),
              onTap: () async {
                if (!_loading) {
                  setState(() {
                    _loading = true;
                  });
                  bool success = await widget.onTap();
                  _controller!.reverse();

                  _controller!.forward();
                  await Future.delayed(const Duration(milliseconds: 600));
                  _controller!.reverse();

                  setState(() {
                    _loading = false;
                  });

                  if (success == false) {
                    return;
                  }
                }
              },
              child: Padding(
                padding: widget.marginButtonLabel ?? EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_loading)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    if (_loading)
                      const SizedBox(width: 10),
                    if (!_loading)
                      AnimatedBuilder(
                        animation: _controller!,
                        builder: (BuildContext context, Widget? child) {
                          return Opacity(
                            opacity: _opacityAnimation!.value,
                            child: Transform.translate(
                              offset: _positionAnimation!.value,
                              child: child,
                            ),
                          );
                        },
                        child: widget.image ?? Container(),
                      ),
                    if (!_loading && widget.image != null)
                      const SizedBox(width: 10),
                    Flexible(
                      child: AnimatedBuilder(
                        animation: _controller!,
                        builder: (BuildContext context, Widget? child) {
                          return Opacity(
                            opacity: _opacityAnimation!.value,
                            child: Transform.translate(
                              offset: _positionAnimation!.value,
                              child: Text(
                                _loading ? widget.labelProgress : widget.labelButton,
                                textAlign: widget.textAlign,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: widget.labelButtonStyle ?? StyleApp.largeTextStyle.copyWith(color: themeColors.textColorRegular),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimateMenuButton extends StatefulWidget {
  final String labelButton;
  final String labelProgress;
  final EdgeInsets? margin;
  final EdgeInsets? marginButtonLabel;
  final double? width;
  final double? height;
  final Color containerColorStart;
  final Color containerColorEnd;
  final double containerOpacity;
  final double containerRadius;
  final Color? borderColor;
  final double borderOpacity;
  final double borderRadius;
  final double borderSize;
  final double xPosition;
  final double yPosition;
  final TextAlign textAlign;
  final TextStyle? labelButtonStyle;
  final Function onTap;
  final Icon? icon;

  const AnimateMenuButton({
    super.key,
    this.labelButton = 'Accept',
    this.labelProgress = 'Loading',
    this.margin,
    this.marginButtonLabel,
    this.width,
    this.height,
    this.containerColorStart = Colors.red,
    this.containerColorEnd = Colors.blue,
    this.containerOpacity = 1.0,
    this.containerRadius = 0,
    this.borderColor,
    this.borderOpacity = 1.0,
    this.borderRadius = 0,
    this.borderSize = 1,
    this.xPosition = 0.0,
    this.yPosition = -5.0,
    this.textAlign = TextAlign.center,
    this.labelButtonStyle,
    required this.onTap,
    this.icon,
  });

  @override
  AnimateMenuButtonState createState() => AnimateMenuButtonState();
}

class AnimateMenuButtonState  extends State<AnimateMenuButton> with SingleTickerProviderStateMixin {
  bool _loading = false;
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(_controller!);
    _positionAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(widget.xPosition, widget.yPosition)).animate(_controller!);
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = ThemeColors(context: context);

    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      constraints: const BoxConstraints(minHeight: 50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [widget.containerColorStart, widget.containerColorEnd],
        ),
        borderRadius: BorderRadius.circular(widget.containerRadius),
        border: Border.all(
          color: widget.borderColor?.withOpacity(widget.borderOpacity) ?? Colors.transparent,
          width: widget.borderSize,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.containerRadius),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            splashColor: Colors.white.withOpacity(0.6),
            highlightColor: Colors.blue.withOpacity(0.6),
            onTap: () async {
              if (!_loading) {
                setState(() {
                  _loading = true;
                });

                bool success = await widget.onTap();
                _controller!.reverse();

                _controller!.forward();
                await Future.delayed(const Duration(milliseconds: 600));
                _controller!.reverse();

                setState(() {
                  _loading = false;
                });

                if (success == false) {
                  return;
                }
              }
            },
            child: Padding(
              padding: widget.marginButtonLabel ?? EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_loading)
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  if (_loading)
                    const SizedBox(height: 10),
                  if (!_loading)
                    AnimatedBuilder(
                      animation: _controller!,
                      builder: (BuildContext context, Widget? child) {
                        return Opacity(
                          opacity: _opacityAnimation!.value,
                          child: Transform.translate(
                            offset: _positionAnimation!.value,
                            child: child,
                          ),
                        );
                      },
                      child: widget.icon ?? Container(),
                    ),
                  if (!_loading && widget.icon != null)
                    const SizedBox(height: 2),
                  Flexible(
                    child: AnimatedBuilder(
                      animation: _controller!,
                      builder: (BuildContext context, Widget? child) {
                        return Opacity(
                          opacity: _opacityAnimation!.value,
                          child: Transform.translate(
                            offset: _positionAnimation!.value,
                            child: Text(
                              _loading ? widget.labelProgress : widget.labelButton,
                              textAlign: widget.textAlign,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: widget.labelButtonStyle ?? StyleApp.mediumTextStyle.copyWith(color: themeColors.textColorRegular),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
