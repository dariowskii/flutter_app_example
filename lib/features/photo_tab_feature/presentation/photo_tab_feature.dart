import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sisal/features/photo_tab_feature/data/providers/image_provider.dart';
import 'package:sisal/features/photo_tab_feature/presentation/choose_image_source_modal.dart';
import 'package:sisal/features/photo_tab_feature/presentation/image_view.dart';

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
      builder: (context) => const ChooseImageSourceModal(),
    );

    if (source == null) {
      return;
    }

    ref.read(imageProvider.notifier).pickImageAndSave(source: source);
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
            'Questo pulsante apre la galleria o la fotocamera per scegliere un\'immagine e visualizzarla.\nPrecarica l\'ultima immagine scelta.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 32),
          switch (asyncImage) {
            AsyncData(:final value) => ImageView(base64Image: value),
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
