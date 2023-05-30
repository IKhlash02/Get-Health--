import 'package:url_launcher/url_launcher.dart';

launchURLBrowser() async {
  const url = 'https://wa.me/6281234567890';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
