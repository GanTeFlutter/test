import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  static final ShareService _instance = ShareService._internal();
  factory ShareService() => _instance;
  ShareService._internal();

  Future<void> shareUrl(String url) async {
    try {
      await SharePlus.instance.share(
        ShareParams(
          text: url,
          sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
        ),
      );
    } catch (e) {
      debugPrint('Share error: $e');
    }
  }
}
