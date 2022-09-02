import 'package:flutter/material.dart';

class ContainerCardReuse extends StatefulWidget {
  ContainerCardReuse({required this.color,required this.cardChild});
  final Color color;
  final Widget cardChild;

  @override
  State<ContainerCardReuse> createState() => _ContainerCardReuseState();
}

class _ContainerCardReuseState extends State<ContainerCardReuse> {
  int hoverColor= 0xff080B1D;
  int cardColor = 0xff1D1F33;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
