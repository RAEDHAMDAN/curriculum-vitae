import 'package:cv/models/cv_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CvController {
  CvModel cvmodel = CvModel();
  void launchURL() async {
    Uri url = Uri.parse(
        'https://www.facebook.com/profile.php?id=100029040224728&mibextid=ZbWKwL');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'could not launch $url';
    }
  }
}
