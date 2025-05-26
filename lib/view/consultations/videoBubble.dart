import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBubble extends StatefulWidget {
  final String videoUrl;
  const VideoBubble({required this.videoUrl, super.key});

  @override
  _VideoBubbleState createState() => _VideoBubbleState();
}

class _VideoBubbleState extends State<VideoBubble> {
  late VideoPlayerController _controller;
  bool _initialized = false;
  bool _showControls = true;
  bool _isMuted = false;
  bool _isFullscreen = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _initialized = true;
        });
        _controller.setLooping(false);
      });

    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {
      _showControls = true; // Show controls when toggled
    });
  }

  void _toggleMute() {
    if (_isMuted) {
      _controller.setVolume(1.0);
    } else {
      _controller.setVolume(0.0);
    }
    setState(() {
      _isMuted = !_isMuted;
      _showControls = true;
    });
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  void _enterFullscreen() {
    setState(() {
      _isFullscreen = true;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullscreenVideoPlayer(controller: _controller),
      ),
    ).then((_) {
      // When returning from fullscreen, reset fullscreen flag
      setState(() {
        _isFullscreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return Container(
        width: 200,
        height: 150,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return GestureDetector(
      onTap: _toggleControls,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 150,
            child: VideoPlayer(_controller),
          ),
          if (_showControls) ...[
            // Centered play/pause button
            Positioned.fill(
              child: Center(
                child: IconButton(
                  iconSize: 64,
                  color: Colors.white,
                  icon: Icon(
                    _controller.value.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                  ),
                  onPressed: _togglePlayPause,
                ),
              ),
            ),

            // Bottom control bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black26,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _isMuted ? Icons.volume_off : Icons.volume_up,
                        color: Colors.white,
                      ),
                      onPressed: _toggleMute,
                    ),
                    Expanded(
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: Colors.blueAccent,
                          bufferedColor: Colors.grey,
                          backgroundColor: Colors.black38,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.fullscreen,
                        color: Colors.white,
                      ),
                      onPressed: _enterFullscreen,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class FullscreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;
  const FullscreenVideoPlayer({required this.controller, super.key});

  @override
  _FullscreenVideoPlayerState createState() => _FullscreenVideoPlayerState();
}

class _FullscreenVideoPlayerState extends State<FullscreenVideoPlayer> {
  @override
  void initState() {
    super.initState();
    // Enter landscape fullscreen, optional: lock orientation here
  }

  @override
  void dispose() {
    // Exit fullscreen, optional: unlock orientation here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Could toggle controls here if you want
          },
          child: AspectRatio(
            aspectRatio: widget.controller.value.aspectRatio,
            child: VideoPlayer(widget.controller),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.fullscreen_exit),
      ),
    );
  }
}
