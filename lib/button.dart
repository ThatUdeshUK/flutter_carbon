import 'package:flutter/material.dart';

enum ButtonSize { FullBleed, Primary, Inline, Small }

/// Buttons
class Button extends MaterialButton {
  final String text;
  final ButtonSize size;

  /// Create a simple text button.
  ///
  /// The [autofocus] and [clipBehavior] arguments must not be null.
  const Button(
      {Key key,
      @required VoidCallback onPressed,
      VoidCallback onLongPress,
      ValueChanged<bool> onHighlightChanged,
      ButtonTextTheme textTheme,
      Color textColor,
      Color disabledTextColor,
      Color color,
      Color disabledColor,
      Color focusColor,
      Color hoverColor,
      Color highlightColor,
      Color splashColor,
      Brightness colorBrightness,
      EdgeInsetsGeometry padding,
      Clip clipBehavior = Clip.none,
      FocusNode focusNode,
      bool autofocus = false,
      MaterialTapTargetSize materialTapTargetSize,
      @required this.text,
      this.size = ButtonSize.Primary})
      : assert(clipBehavior != null),
        assert(autofocus != null),
        super(
            key: key,
            onPressed: onPressed,
            onLongPress: onLongPress,
            onHighlightChanged: onHighlightChanged,
            textTheme: textTheme,
            textColor: textColor,
            disabledTextColor: disabledTextColor,
            color: color,
            disabledColor: disabledColor,
            focusColor: focusColor,
            hoverColor: hoverColor,
            highlightColor: highlightColor,
            splashColor: splashColor,
            colorBrightness: colorBrightness,
            padding: padding,
            clipBehavior: clipBehavior,
            focusNode: focusNode,
            autofocus: autofocus,
            materialTapTargetSize: materialTapTargetSize);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context).copyWith(
      height: _getButtonSize(size),
    );

    return RawMaterialButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHighlightChanged: onHighlightChanged,
      fillColor: buttonTheme.getFillColor(this),
      textStyle: theme.textTheme.button
          .copyWith(color: buttonTheme.getTextColor(this)),
      focusColor: buttonTheme.getFocusColor(this),
      hoverColor: buttonTheme.getHoverColor(this),
      highlightColor: buttonTheme.getHighlightColor(this),
      splashColor: buttonTheme.getSplashColor(this),
      elevation: buttonTheme.getElevation(this),
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      padding: _getPadding(size),
      constraints: buttonTheme.getConstraints(this),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      materialTapTargetSize: buttonTheme.getMaterialTapTargetSize(this),
      animationDuration: buttonTheme.getAnimationDuration(this),
      child: Text(
        this.text,
        textAlign: TextAlign.start,
      ),
    );
  }

  EdgeInsets _getPadding(ButtonSize size) {
    return EdgeInsets.only(
      left: 16,
      right: 64,
      bottom: size == ButtonSize.FullBleed ? 16 : 0,
    );
  }

  double _getButtonSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.FullBleed:
        return 64;
      case ButtonSize.Inline:
        return 40;
      case ButtonSize.Small:
        return 32;
      default:
        return 48;
    }
  }
}
