import 'package:flutter/material.dart';

import 'Input_page.dart';


class BottomContainer extends StatelessWidget {
  BottomContainer({required this.text, required this.onTap});
  final Text text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bottonContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
        height: bottonContainerHeight,
        child:Center(
            child: text
        ),
      ),
    );
  }
}
