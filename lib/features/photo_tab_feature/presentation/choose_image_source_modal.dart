import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImageSourceModal extends StatelessWidget {
  const ChooseImageSourceModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Galleria'),
              onTap: () {
                Navigator.pop(
                  context,
                  ImageSource.gallery,
                );
              },
            ),
            ListTile(
              title: const Text('Fotocamera'),
              onTap: () {
                Navigator.pop(
                  context,
                  ImageSource.camera,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
