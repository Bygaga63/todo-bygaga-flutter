import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  final Widget child;
  final Function onTap;
  SimpleCard({@required this.child, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ));
  }
}
