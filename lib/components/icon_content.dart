import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.ic, @required this.gender});
  final IconData ic;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ic,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
