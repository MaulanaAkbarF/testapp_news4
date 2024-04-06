import 'package:flutter/material.dart';
import '../Style/Styleapp.dart';
import '../Style/Themeapp.dart';

class SettingMenu extends StatefulWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String labelButton;
  final String labelDescription;
  final EdgeInsets? margin;
  final EdgeInsets? marginButtonLabel;
  final double spaceIcon;
  final CrossAxisAlignment crossAxisAlignment;
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
  final Function()? onTap;

  const SettingMenu({
    super.key,
    this.labelButton = 'Accept',
    this.labelDescription = '',
    this.prefixIcon,
    this.suffixIcon,
    this.spaceIcon = 10,
    this.margin,
    this.marginButtonLabel,
    this.crossAxisAlignment = CrossAxisAlignment.start,
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
    this.onTap,
  });

  @override
  State<SettingMenu> createState() => _SettingMenuState();
}

class _SettingMenuState extends State<SettingMenu> {
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
                widget.onTap!();
              },
              child: Padding(
                padding: widget.marginButtonLabel ?? EdgeInsets.zero,
                child: Row(
                  children: [
                    widget.prefixIcon ?? Container(),
                    SizedBox(width: widget.spaceIcon),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: widget.crossAxisAlignment,
                        children: [
                          Text(
                            widget.labelButton,
                            textAlign: widget.textAlign,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: widget.labelButtonStyle ?? StyleApp.largeTextStyle.copyWith(color: themeColors.textColorRegular),
                          ),
                          if (widget.labelDescription == '') ...[
                            Container()
                          ] else if (widget.labelDescription != '') ...[
                            Text(
                              widget.labelDescription,
                              textAlign: widget.textAlign,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: widget.labelButtonStyle ?? StyleApp.largeTextStyle.copyWith(color: themeColors.textColorRegular),
                            ),
                          ]
                        ],
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

class SettingMenuDropdown extends StatefulWidget {
  final Icon? prefixIcon;
  final String labelButton;
  final String labelDescription;
  final EdgeInsets? margin;
  final EdgeInsets? marginButtonLabel;
  final double spaceIcon;
  final CrossAxisAlignment crossAxisAlignment;
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
  final List<String> items;
  final String value;
  final ValueChanged<String?>? onChanged;

  const SettingMenuDropdown({
    super.key,
    this.labelButton = 'Accept',
    this.labelDescription = '',
    this.prefixIcon,
    this.spaceIcon = 10,
    this.margin,
    this.marginButtonLabel,
    this.crossAxisAlignment = CrossAxisAlignment.start,
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
    this.items = const [],
    this.value = '',
    this.onChanged,
  });

  @override
  State<SettingMenuDropdown> createState() => _SettingMenuDropdownState();
}

class _SettingMenuDropdownState extends State<SettingMenuDropdown> {
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
        child: Padding(
          padding: widget.marginButtonLabel ?? EdgeInsets.zero,
          child: Row(
            children: [
              widget.prefixIcon ?? Container(),
              SizedBox(width: widget.spaceIcon),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: widget.crossAxisAlignment,
                  children: [
                    Text(
                      widget.labelButton,
                      textAlign: widget.textAlign,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: widget.labelButtonStyle ?? StyleApp.largeTextStyle.copyWith(color: themeColors.textColorRegular),
                    ),
                    if (widget.labelDescription == '') ...[
                      const SizedBox()
                    ] else if (widget.labelDescription != '') ...[
                      Text(
                        widget.labelDescription,
                        textAlign: widget.textAlign,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: widget.labelButtonStyle ?? StyleApp.mediumTextStyle.copyWith(color: themeColors.textColorRegular),
                      ),
                    ]
                  ],
                ),
              ),
              SizedBox(width: widget.spaceIcon),
              DropdownButton<String>(
                underline: const SizedBox(),
                value: widget.value,
                alignment: Alignment.centerRight,
                onChanged: widget.onChanged,
                items: widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}