import 'package:url_launcher/url_launcher.dart';

class UrlService {
  Future<void> openDefault(Uri url) {
    return launchUrl(
      url,
      mode: LaunchMode.platformDefault,
    );
  }
}
