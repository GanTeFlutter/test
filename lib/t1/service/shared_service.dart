import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  static final ShareService _instance = ShareService._internal();
  factory ShareService() => _instance;
  ShareService._internal();

  Future<void> shareUrl(String url, {VoidCallback? onShared}) async {
    try {
      await SharePlus.instance.share(
        ShareParams(
          text: url,
          sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
        ),
      );
      // Share dialog açıldığında callback çağır
      onShared?.call();
    } catch (e) {
      debugPrint('Share error: $e');
    }
  }
}
