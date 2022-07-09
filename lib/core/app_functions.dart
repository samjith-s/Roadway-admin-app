import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

Future<void> goToMail(String email) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject= &body=',
  );

  var url = params.toString();
  try {
    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    log(e.toString());
  }
}

Future<void> lauchCall(String number) async {
  final url = Uri(
    scheme: 'tel',
    path: number,
  );
  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    log(e.toString());
  }
}
