import 'package:flutter/material.dart';

class CvImage extends StatelessWidget {
  final String path;
  const CvImage({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
