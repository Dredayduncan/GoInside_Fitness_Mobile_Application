import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicItem extends StatelessWidget {
  final String label;
  final String link;

  const MusicItem({Key? key, required this.label, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL();
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFFCF4E1),
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.music_note,
                      size: 30,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            label,
                            style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: Text(
                              link,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          )
      ),
    );
  }

  void _launchURL() async {
    if (!await launch(link)){
      throw "Could not launch $link";
    }
  }
}
