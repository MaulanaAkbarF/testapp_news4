import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Style/Styleapp.dart';
import '../Style/Themeapp.dart';
import 'package:intl/intl.dart';
import 'TextStyles.dart';

class LongListViewBuilderFirestore extends StatefulWidget {
  final Stream<QuerySnapshot<Object?>>? streamQuerySnapshot;
  final ScrollPhysics? physics;
  final bool wantKeepAlive;
  final String imagePathField;
  final String titleField;
  final String titleIndicatorField;
  final TextStyle? titleFieldStyle;
  final String descField;
  final String descInfoField;
  final TextStyle? descFieldStyle;
  final double containerSize;
  final Color? containerColor;
  final Color? borderColor;
  final double containerOpacity;
  final double borderOpacity;
  final double borderRadiusCircular;
  final double borderSize;
  final void Function(QueryDocumentSnapshot, int)? onTap;

  const LongListViewBuilderFirestore({
    Key? key,
    required this.streamQuerySnapshot,
    this.physics,
    this.wantKeepAlive = false,
    this.imagePathField = 'assets/Icon/logo.png',
    required this.titleField,
    required this.titleIndicatorField,
    this.titleFieldStyle,
    required this.descField,
    required this.descInfoField,
    this.descFieldStyle,
    this.containerSize = 100,
    this.containerColor,
    this.borderColor,
    this.containerOpacity = 1.0,
    this.borderOpacity = 1.0,
    this.borderRadiusCircular = 0,
    this.borderSize = 1,
    this.onTap,
  }) : super(key: key);

  @override
  LongListViewBuilderFirestoreState createState() => LongListViewBuilderFirestoreState();
}

class LongListViewBuilderFirestoreState extends State<LongListViewBuilderFirestore> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _opacityAnimations = [];
  final List<Animation<double>> _translationAnimations = [];

  @override
  bool get wantKeepAlive => widget.wantKeepAlive;

  @override
  void initState() {
    super.initState();
    widget.streamQuerySnapshot!.listen((QuerySnapshot snapshot) {
      for (var i = 0; i < snapshot.docs.length; i++) {
        _controllers.add(AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
        ));

        _opacityAnimations.add(Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controllers[i],
            curve: Curves.easeInOut,
          ),
        ));

        _translationAnimations.add(Tween<double>(begin: -50.0, end: 0.0).animate(
          CurvedAnimation(
            parent: _controllers[i],
            curve: Curves.easeInOut,
          ),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ThemeColors themeColors = ThemeColors(context: context);

    return StreamBuilder<QuerySnapshot>(
      stream: widget.streamQuerySnapshot,
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('There an error occurred');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Loading Data'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          physics: widget.physics,
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            QueryDocumentSnapshot data = snapshot.data!.docs[index];
            Future.delayed(Duration(milliseconds: index * 100), () {
              _controllers[index].forward();
            });

            return GestureDetector(
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!(data, index);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AnimatedBuilder(
                  animation: _controllers[index],
                  builder: (context, child) {
                    return Opacity(
                      opacity: _opacityAnimations[index].value,
                      child: Transform.translate(
                        offset: Offset(
                            _translationAnimations[index].value, 0),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    height: widget.containerSize,
                    decoration: BoxDecoration(
                      color: widget.containerColor?.withOpacity(
                          widget.containerOpacity) ??
                          Colors.grey.shade700,
                      borderRadius:
                      BorderRadius.circular(widget.borderRadiusCircular),
                      border: Border.all(
                        color: widget.borderColor?.withOpacity(
                            widget.borderOpacity) ??
                            Colors.transparent,
                        width: widget.borderSize,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(data.id.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: widget.descFieldStyle ?? StyleApp.semiLargeTextStyle.copyWith(
                                    color: themeColors.textColorRegular.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(widget.borderRadiusCircular)
                                ),
                                child: Image.asset(
                                  'assets/Image/myonionmonitoring.png',
                                  width: 150,
                                  height: 20,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      text: TextSpan(
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: data[widget.titleField],
                                            style: widget.titleFieldStyle ?? StyleApp.giganticTextStyle.copyWith(
                                              color: themeColors.textColorRegular,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          TextSpan(
                                            text: data[widget.titleIndicatorField],
                                            style: widget.titleFieldStyle ?? StyleApp.extraLargeTextStyle.copyWith(
                                              color: themeColors.textColorRegular,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(data[widget.descField].toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: widget.descFieldStyle ?? StyleApp.semiLargeTextStyle.copyWith(
                                            color: themeColors.textColorRegular.withOpacity(0.8),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(data[widget.descInfoField].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: widget.descFieldStyle ?? StyleApp.mediumTextStyle.copyWith(
                                          color: themeColors.textColorRegular.withOpacity(0.7),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class ArrowListViewBuilderFirestore extends StatefulWidget {
  final Stream<QuerySnapshot<Object?>>? streamQuerySnapshot;
  final ScrollPhysics? physics;
  final bool wantKeepAlive;
  final TextStyle? titleFieldStyle;
  final String timeInfoField;
  final String descField;
  final TextStyle? descFieldStyle;
  final double? containerSize;
  final Color? containerColor;
  final Color? borderColor;
  final double containerOpacity;
  final double borderOpacity;
  final double borderRadiusCircular;
  final double borderSize;
  final Color gradientStart;
  final Color gradientEnd;
  final int? itemLimit;
  final String? showAllText;
  final void Function(QueryDocumentSnapshot, int)? onTap;

  const ArrowListViewBuilderFirestore({
    Key? key,
    required this.streamQuerySnapshot,
    this.physics,
    this.wantKeepAlive = false,
    this.titleFieldStyle,
    required this.timeInfoField,
    required this.descField,
    this.descFieldStyle,
    this.containerSize,
    this.containerColor,
    this.borderColor,
    this.containerOpacity = 1.0,
    this.borderOpacity = 1.0,
    this.borderRadiusCircular = 0,
    this.borderSize = 1,
    required this.gradientStart,
    required this.gradientEnd,
    this.itemLimit,
    this.showAllText,
    this.onTap,
  }) : super(key: key);

  @override
  ArrowListViewBuilderFirestoreState createState() => ArrowListViewBuilderFirestoreState();
}

class ArrowListViewBuilderFirestoreState extends State<ArrowListViewBuilderFirestore> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _opacityAnimations = [];
  final List<Animation<double>> _translationAnimations = [];
  bool _showAll = false;

  @override
  bool get wantKeepAlive => widget.wantKeepAlive;

  @override
  void initState() {
    super.initState();
    widget.streamQuerySnapshot!.listen((QuerySnapshot snapshot) {
      for (var i = 0; i < snapshot.docs.length; i++) {
        _controllers.add(AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
        ));

        _opacityAnimations.add(Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controllers[i],
            curve: Curves.easeInOut,
          ),
        ));

        _translationAnimations.add(Tween<double>(begin: -50.0, end: 0.0).animate(
          CurvedAnimation(
            parent: _controllers[i],
            curve: Curves.easeInOut,
          ),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ThemeColors themeColors = ThemeColors(context: context);

    return StreamBuilder<QuerySnapshot>(
      stream: widget.streamQuerySnapshot,
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('There an error occurred');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Loading Data'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        int itemCount = _showAll ? snapshot.data!.docs.length : min(widget.itemLimit ?? snapshot.data!.docs.length, snapshot.data!.docs.length);

        return ListView.builder(
          physics: widget.physics,
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            QueryDocumentSnapshot data = snapshot.data!.docs[index];
            Future.delayed(Duration(milliseconds: index * 100), () {
              _controllers[index].forward();
            });

            return GestureDetector(
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!(data, index);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AnimatedBuilder(
                  animation: _controllers[index],
                  builder: (context, child) {
                    return Opacity(
                      opacity: _opacityAnimations[index].value,
                      child: Transform.translate(
                        offset: Offset(
                            _translationAnimations[index].value, 0),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    height: widget.containerSize,
                    decoration: BoxDecoration(
                      color: widget.containerColor?.withOpacity(
                          widget.containerOpacity) ??
                          Colors.grey.shade700,
                      borderRadius:
                      BorderRadius.circular(widget.borderRadiusCircular),
                      border: Border.all(
                        color: widget.borderColor?.withOpacity(
                            widget.borderOpacity) ??
                            Colors.transparent,
                        width: widget.borderSize,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                child: GradientText(
                                  text: data.id.toString(),
                                  maxLines: 1,
                                  textStyle: widget.titleFieldStyle ?? StyleApp.largeTextStyle.copyWith(
                                    color: themeColors.textColorRegular,
                                    fontWeight: FontWeight.w800
                                  ),
                                  gradientColors: [widget.gradientStart, widget.gradientEnd],
                                ),
                              ),
                              Text(
                                DateFormat('dd MMMM yyyy').format(
                                  (data[widget.timeInfoField] as Timestamp).toDate(),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: StyleApp.semiLargeTextStyle.copyWith(
                                  color: themeColors.containerColorLightGrey.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(data[widget.descField].toString(),
                              textAlign: TextAlign.left,
                              style: widget.descFieldStyle ?? StyleApp.semiLargeTextStyle.copyWith(
                                color: themeColors.textColorRegular.withOpacity(0.8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

