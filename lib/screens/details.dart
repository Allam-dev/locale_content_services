import 'package:flutter/material.dart';
import 'package:mosta2/core/assets.dart';
import 'package:mosta2/core/extensions.dart';
import 'package:video_player/video_player.dart';

class DetailsScreen extends StatefulWidget {
  final int serviceId;
  final String qrPath;
  const DetailsScreen({super.key, required this.serviceId, required this.qrPath});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset(Assets.serviceVideo(widget.serviceId))
          ..initialize().then((value) => {setState(() {})});
    _controller.setVolume(0.0);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _controller.value.isInitialized
            ? Stack(
                children: [
                  Center(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: context.ofSH(0.075),
                    left: context.ofSW(0.06),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        Assets.backButton,
                        width: context.ofSW(0.37),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: context.ofSH(0.075),
                    right: context.ofSW(0.06),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        widget.qrPath,
                        width: context.ofSW(0.2),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
