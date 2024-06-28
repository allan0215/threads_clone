import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/screens/camera/camera_recording_screen.dart';

class PostScreenSheet extends StatefulWidget {
  const PostScreenSheet({
    super.key,
  });

  @override
  State<PostScreenSheet> createState() => _PostScreenSheetState();
}

class _PostScreenSheetState extends State<PostScreenSheet> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isTextEmpty = true;
  File? _resultMedia;

  void _onXPressed() {
    _resultMedia = null;
    setState(() {});
  }

  void _onFileTap() async {
    final media = await Navigator.push<XFile>(
        context,
        MaterialPageRoute(
          builder: (context) => const CameraRecordingScreen(),
        ));
    if (media != null) {
      _resultMedia = File(media.path);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      if (_textEditingController.value.text != "") {
        _isTextEmpty = false;
      } else {
        _isTextEmpty = true;
      }
      setState(() {});
      print(_isTextEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leadingWidth: 75,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Center(
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "New thread",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(color: Colors.white),
                            child: const CircleAvatar(
                              foregroundImage: NetworkImage("https://picsum.photos/300/300"),
                              radius: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "SeanWho?",
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w500, height: 1),
                                    ),
                                  ],
                                ),
                                Flexible(
                                  child: TextField(
                                    autofocus: true,
                                    controller: _textEditingController,
                                    enableSuggestions: false,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none, hintText: "Start a thread..."),
                                  ),
                                ),
                                if (_resultMedia != null) ...[
                                  Stack(
                                    children: [
                                      Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(.7),
                                            width: 1.5,
                                            strokeAlign: BorderSide.strokeAlignOutside,
                                          ),
                                        ),
                                        child: Image.file(_resultMedia!),
                                      ),
                                      Positioned(
                                        top: 0,
                                        child: IconButton(
                                          onPressed: _onXPressed,
                                          icon: const FaIcon(FontAwesomeIcons.solidCircleXmark),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: _onFileTap,
                                      child: FaIcon(
                                        FontAwesomeIcons.paperclip,
                                        color: Colors.grey.withOpacity(.7),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Anyone can reply"),
                    Text(
                      "Post",
                      style: TextStyle(
                        color: _isTextEmpty ? Colors.black : Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
