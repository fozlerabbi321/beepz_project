import 'package:flutter/material.dart';

import '../../../../constants/colors_data.dart';

class IconIndicator extends StatelessWidget {
  const IconIndicator({
    Key? key,
    required this.size,
    this.complete = false,
  }) : super(key: key);

  final double size;
  final bool complete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: size,
              width: size,
              child: complete
                  ? const Icon(
                Icons.check_circle,
                color: kSuccessColor,
              )
                  : const Icon(
                Icons.circle,
                color: kOrdinaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}