//Render image with fit option as fitHeight
import 'package:flutter/material.dart';

class RenderImage extends StatelessWidget {
  final String path;
  final AlignmentGeometry alignment;
  const RenderImage({super.key, required this.path, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: alignment,
          fit: BoxFit.fitHeight,
          image: AssetImage(path),
        ),
      ),
    );
  }
}
