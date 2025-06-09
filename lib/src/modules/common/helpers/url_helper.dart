import 'package:url_launcher/url_launcher.dart';

Future<void> tryLaunchURL(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

String extractDomain(String url) {
  final uri = Uri.tryParse(url);
  List? domain = uri?.host.split('.');
  if (domain != null) {
    domain.removeAt(0);
  }

  return domain?.join('.') ?? url;
}
