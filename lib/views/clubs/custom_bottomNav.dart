import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key key,
    @required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.margin = const EdgeInsets.all(8),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
  }) : super(key: key);

  final List<CustomBottomBarItem> items;

  final int currentIndex;

  final Function(int) onTap;

  final Color selectedItemColor;

  final Color unselectedItemColor;

  final EdgeInsets margin;

  final EdgeInsets itemPadding;

  final Duration duration;

  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (final item in items)
            TweenAnimationBuilder<double>(
              tween: Tween(
                end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
              ),
              curve: curve,
              duration: duration,
              builder: (context, t, _) {
                final _selectedColor = item.selectedColor ??
                    selectedItemColor ??
                    theme.primaryColor;

                final _unselectedColor = item.unselectedColor ??
                    unselectedItemColor ??
                    theme.iconTheme.color;

                return Material(
                  color: Color.lerp(_selectedColor.withOpacity(0.0),
                      _selectedColor.withOpacity(0.1), t),
                  shape: StadiumBorder(),
                  child: InkWell(
                    onTap: () => onTap?.call(items.indexOf(item)),
                    customBorder: StadiumBorder(),
                    focusColor: _selectedColor.withOpacity(0.1),
                    highlightColor: _selectedColor.withOpacity(0.1),
                    splashColor: _selectedColor.withOpacity(0.1),
                    hoverColor: _selectedColor.withOpacity(0.1),
                    child: Padding(
                      padding: itemPadding -
                          EdgeInsets.only(right: itemPadding.right * t),
                      child: Row(
                        children: [
                          IconTheme(
                            data: IconThemeData(
                              color: Color.lerp(
                                  _unselectedColor, _selectedColor, t),
                              size: 24,
                            ),
                            child: item.icon ?? SizedBox.shrink(),
                          ),
                          ClipRect(
                            child: SizedBox(
                              height: 20,
                              child: Align(
                                alignment: Alignment(-0.2, 0.0),
                                widthFactor: t,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: itemPadding.right / 2,
                                      right: itemPadding.right),
                                  child: DefaultTextStyle(
                                    style: TextStyle(
                                      color: Color.lerp(
                                          _selectedColor.withOpacity(0.0),
                                          _selectedColor,
                                          t),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    child: item.title ?? SizedBox.shrink(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class CustomBottomBarItem {
  final Widget icon;

  final Widget title;

  final Color selectedColor;

  final Color unselectedColor;

  CustomBottomBarItem({
    @required this.icon,
    @required this.title,
    this.selectedColor,
    this.unselectedColor,
  })  : assert(icon != null, "Every CustomBottomBarItem requires an icon."),
        assert(title != null, "Every CustomBottomBarItem requires a title.");
}
