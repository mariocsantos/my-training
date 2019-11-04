import 'package:flutter/material.dart';

class FooterLink extends StatelessWidget {
  final String text;
  final String actionName;
  final String actionRoute;

  FooterLink({this.text, this.actionName, this.actionRoute});

  @override
  Widget build(BuildContext context) {
    final double padding = 24;
    final double height = 44;

    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color color = (isDark ? Colors.white : Colors.black).withOpacity(0.1);

    return Container(
      padding: EdgeInsets.only(left: padding, right: padding),
      height: height,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            actionName.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
