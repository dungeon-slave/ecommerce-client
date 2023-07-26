import 'package:url_launcher/url_launcher.dart';

class UrlService {
  Future<void> openInBrowser(Uri url) async {
    await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
    );
  }
}
