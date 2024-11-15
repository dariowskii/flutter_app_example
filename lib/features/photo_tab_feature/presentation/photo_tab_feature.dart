import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sisal/features/photo_tab_feature/data/providers/image_provider.dart'
    hide Image;

class PhotoTabFeature extends ConsumerStatefulWidget {
  const PhotoTabFeature({super.key});

  @override
  ConsumerState<PhotoTabFeature> createState() => _PhotoTabFeatureState();
}

class _PhotoTabFeatureState extends ConsumerState<PhotoTabFeature>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void _chooseSource() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) {
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
      },
    );

    if (source == null) {
      return;
    }

    _pickImage(source: source);
  }

  void _pickImage({required ImageSource source}) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
      );

      if (image == null) {
        return;
      }

      final bytes = await image.readAsBytes();
      ref.read(imageProvider.notifier).save(bytes);
    } catch (e) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Errore durante il caricamento dell\'immagine.: $e',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final asyncImage = ref.watch(imageProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Questo pulsante apre la galleria o la fotocamera per scegliere un\'immagine e visualizzarla.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 32),
          switch (asyncImage) {
            AsyncData(:final value) => value != null
                ? AspectRatio(
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
                          base64Decode(value),
                          width: double.infinity,
                          fit: BoxFit.cover,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            AsyncError(:final error) => Text('Errore: $error'),
            _ => const CircularProgressIndicator.adaptive(),
          },
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _chooseSource,
            child: const Text('Scegli immagine'),
          ),
        ],
      ),
    );
  }
}
