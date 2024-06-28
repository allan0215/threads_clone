import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraRecordingScreen extends StatefulWidget {
  const CameraRecordingScreen({super.key});

  @override
  State<CameraRecordingScreen> createState() => _CameraRecordingScreenState();
}

class _CameraRecordingScreenState extends State<CameraRecordingScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late CameraController _cameraController;
  late final AnimationController _progressAnimationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
    lowerBound: 0.0,
    upperBound: 1.0,
  );
  late final double maxZoom;

  final bool _isSelfieMode = false;

  bool _hasPermission = false;
  bool _appActivated = true;

  late final bool _noCamera = kDebugMode && Platform.isIOS;

  // functions for buttons

  void _onBackPressed() {
    Navigator.pop(context);
  }

  void _onLibraryPressed() async {
    final media = await ImagePicker().pickMedia();
    if (media == null) return;
    if (!mounted) return;
    Navigator.pop(context, media);
  }

  // initializer

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) throw "now available cameras";

    _cameraController =
        CameraController(cameras[_isSelfieMode ? 1 : 0], ResolutionPreset.ultraHigh);

    await _cameraController.initialize();

    // for ios
    await _cameraController.prepareForVideoRecording();

    _initMaxZoom();
    setState(() {});
  }

  Future<void> _initMaxZoom() async {
    maxZoom = await _cameraController.getMaxZoomLevel();
  }

  Future<void> _initPermission() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied = cameraPermission.isDenied;
    final micDenied = micPermission.isDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await _initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    if (!_noCamera || !_hasPermission || !_cameraController.value.isInitialized) {
      _initPermission();
    }

    WidgetsBinding.instance.addObserver(this);
    _progressAnimationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Future didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_noCamera) return;
    if (!_cameraController.value.isInitialized) return;

    switch (state) {
      case AppLifecycleState.resumed:
        _appActivated = true;
        await _initPermission();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        _appActivated = false;
        setState(() {});
// 위젯 트리에서 CameraPreview를 제거 후, dispose 해야한다.
// setState와의 순서 중요
        _cameraController.dispose();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: !_hasPermission // || !_cameraController.value.isInitialized
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Requesting permissions.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            )
          : SizedBox(
              height: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  if (_appActivated)
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: CameraPreview(_cameraController),
                    ),
                  Positioned(
                    top: 45,
                    left: 15,
                    child: IconButton(
                      onPressed: _onBackPressed,
                      icon: const FaIcon(
                        FontAwesomeIcons.chevronLeft,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 80,
                    child: Text(
                      "Camera",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    right: 60,
                    child: GestureDetector(
                      onTap: _onLibraryPressed,
                      child: Text(
                        "Library",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(.7),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 200,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            value: 1,
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
