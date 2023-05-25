import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class InfoSquare extends StatelessWidget {
  final double iconSize;
  final double spaceWidth;
  const InfoSquare({Key? key, this.iconSize = 18, this.spaceWidth = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconText(
          icon: Icon(FontAwesome.users, color: Colors.black45, size: iconSize),
          text: "4 Watu ",
        ),
        SizedBox(width: spaceWidth),
        IconText(
          icon:
              Icon(FontAwesome.calendar, color: Colors.black45, size: iconSize),
          text: "2 Miezi ",
        ),
        // SizedBox(width: spaceWidth),
        // IconText(
        //   icon: Icon(MaterialIcons.square_foot,
        //       color: Colors.black45, size: iconSize),
        //   text: "5 Mita",
        // ),
      ],
    );
  }
}

class IconText extends StatelessWidget {
  final Icon icon;
  final String text;

  const IconText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.black45),
        ),
      ],
    );
  }
}
