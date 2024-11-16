import 'dart:convert';

import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.base64Image,
  });

  final String? base64Image;

  @override
  Widget build(BuildContext context) {
    if (base64Image == null) {
      return const SizedBox.shrink();
    }

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.memory(
            base64Decode(base64Image!),
            width: double.infinity,
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }
}
