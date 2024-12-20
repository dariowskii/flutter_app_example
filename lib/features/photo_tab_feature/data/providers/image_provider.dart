import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'image_provider.g.dart';

@riverpod
class Image extends _$Image {
  @override
  FutureOr<String?> build() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('image');
  }

  void pickImageAndSave({required ImageSource source}) async {
    final image = await ImagePicker().pickImage(
      source: source,
    );

    if (image == null) {
      return;
    }

    final bytes = await image.readAsBytes();
    final base64Encoded = await compute(base64Encode, bytes);
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('image', base64Encoded);
    state = AsyncData(base64Encoded);
  }
}
