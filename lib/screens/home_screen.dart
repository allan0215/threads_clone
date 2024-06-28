import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/screens/widgets/post_widget.dart';
import 'package:thread_clone/services/unsplash_parse.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        shadowColor: Colors.transparent,
        elevation: 0,
        title: const FaIcon(
          FontAwesomeIcons.threads,
          size: 40,
          color: Colors.black,
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PostWidget(
                itemCount: Random().nextInt(9) + 1,
                widgetIndex: index,
                imageId: Random().nextBool() ? (index + 1) : null,
                title: lorem(paragraphs: 1, words: 1),
                subtitle: lorem(paragraphs: 1, words: Random().nextInt(100) + 20),
                isVerified: Random().nextBool(),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black26, width: 1, strokeAlign: BorderSide.strokeAlignCenter),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          },
          itemCount: 10),
    );
  }
}
