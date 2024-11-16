import 'package:flutter/material.dart';
import 'package:sisal/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinkTab extends StatelessWidget {
  const ExternalLinkTab({super.key});

  void _openInstagram(BuildContext context) async {
    final instagramScheme = Uri.parse('instagram://user?username=instagram');
    try {
      if (await canLaunchUrl(instagramScheme)) {
        await launchUrl(
          mode: LaunchMode.externalApplication,
          instagramScheme,
        );
        return;
      }

      await launchUrl(
        mode: LaunchMode.externalApplication,
        Uri.parse(
          Strings.instagramStoreLink,
        ),
      );
    } catch (e) {
      if (!context.mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Errore: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Questo pulsante tenta di aprire l\'app di Instagram, se installata.\nSe non funziona, apre lo store per scaricarla.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => _openInstagram(context),
            child: const Text('Apri Instagram'),
          ),
        ],
      ),
    );
  }
}
