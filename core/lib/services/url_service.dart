import 'package:url_launcher/url_launcher.dart';

class UrlService {
  Future<void> openDefault(Uri url) async {
    await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
    );
  }
}
