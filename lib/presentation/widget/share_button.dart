import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareButton extends StatelessWidget {
  final String facebookShareLink;
  final String whatsappShareLink;
  final String linkedinShareLink;
  const ShareButton(
      {super.key,
      required this.facebookShareLink,
      required this.whatsappShareLink,
      required this.linkedinShareLink});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      icon: Icon(Icons.share),
      iconSize: 30,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.only(left: 24, top: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mau Bagikan\nKe mana?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 28),
                    GestureDetector(
                      onTap: () async {
                        var url = Uri.parse(facebookShareLink);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(width: 24),
                            Image.asset(
                              "assets/icons/facebook.png",
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 24),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: 16,
                            ),
                            SizedBox(width: 24),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () async {
                        var url = Uri.parse(whatsappShareLink);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(width: 24),
                            Image.asset(
                              "assets/icons/whatsapp.png",
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 24),
                            Text(
                              "Whatsapp",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: 16,
                            ),
                            SizedBox(width: 24),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () async {
                        var url = Uri.parse(linkedinShareLink);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(width: 24),
                            Image.asset(
                              "assets/icons/linkedin.png",
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 24),
                            Text(
                              "Linkedin",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: 16,
                            ),
                            SizedBox(width: 24),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
