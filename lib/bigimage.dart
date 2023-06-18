
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AboutPage extends StatefulWidget {
  final SearchResult searchResult;
  //final String newUrlImage;

  const AboutPage({super.key,
    required this.searchResult,
    });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  //late TextEditingController controller;
  late SearchResult searchResult2;

  @override
  void initState() {

    searchResult2 = SearchResult(
        // title: widget.cardInfo.title,
        // numberOfCard: widget.cardInfo.numberOfCard,
        imageUrl: widget.searchResult.imageUrl
    );
   // controller = TextEditingController(text: cardInfo2.title);

    super.initState();
  }
  //
  // void save() {
  //   cardInfo2.title = controller.text;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.network(
               widget.searchResult.imageUrl,
                      width: double.infinity,
                      height: 240,
                      fit: BoxFit.contain,
                    ),

                ),

            ),
          ),
    );
  }
}