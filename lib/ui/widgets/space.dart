import 'package:flutter/cupertino.dart';

class VSpace extends SizedBox {
  const VSpace(double height) : super(height: height);
}

class HSpace extends SizedBox {
  const HSpace(double width) : super(width: width);
}

extension SpaceBetweenExtension on List<Widget> {
  List<Widget> spaceBetween({double? width, double? height}) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) SizedBox(width: width, height: height),
          this[i],
        ],
      ];
}
