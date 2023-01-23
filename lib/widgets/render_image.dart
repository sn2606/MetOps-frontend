import 'package:flutter/material.dart';

/// Render image with fit option as fitHeight
class RenderImage extends StatelessWidget {
  /// Path to the image.
  final String path;

  /// Alignment of the image in the containter.
  final AlignmentGeometry alignment;

  /// Constructor to Render image with fit option as fitHeight.
  /// Requires path to the image and alignment of the image in the container.
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
