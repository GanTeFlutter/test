import 'package:flutter/material.dart';
import 'package:flutter_application_1/t1/home/home_view.dart';
import 'package:flutter_application_1/t1/service/shared_service.dart';

abstract class ShareDemoPage extends State<HomeView> {
  late final ShareService shareService;
  late final TextEditingController urlController;

  @override
  void initState() {
    super.initState();
    shareService = ShareService();
    urlController = TextEditingController();
    urlController.text = 'https://flutter.dev';
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  void share() {
    if (urlController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a URL')));
      return;
    }
    shareService.shareUrl(urlController.text);
  }
}
