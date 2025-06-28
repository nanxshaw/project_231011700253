import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MediaItem {
  final String title;
  final String type;
  final String assetPath;
  final String description;

  MediaItem({
    required this.title,
    required this.type,
    required this.assetPath,
    required this.description,
  });
}

class MediaListView extends StatefulWidget {
  @override
  _MediaListViewState createState() => _MediaListViewState();
}

class _MediaListViewState extends State<MediaListView> {
  final List<MediaItem> mediaItems = [
    MediaItem(
      title: 'Sound Wave',
      type: 'audio',
      assetPath: 'assets/media/wave.mp3',
      description: 'Audio sound wave',
    ),
    MediaItem(
      title: 'Video Syuting Microwave',
      type: 'video',
      assetPath: 'assets/media/video.mp4',
      description: 'Video microwave baruu',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text('Media Player',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF6200EE),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: mediaItems.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final item = mediaItems[index];
          return Card(
            elevation: 4,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          item.type == 'audio' ? Icons.audiotrack : Icons.movie,
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(width: 8),
                        Text(item.title,
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(item.description,
                        style:
                            TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                    const SizedBox(height: 12),
                    item.type == 'audio'
                        ? AudioPlayerWidget(assetPath: item.assetPath)
                        : VideoPlayerWidget(assetPath: item.assetPath),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  final String assetPath;
  const AudioPlayerWidget({required this.assetPath});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setAsset(widget.assetPath);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.black),
          ),
          onPressed: () => _player.play(),
          icon: const Icon(Icons.play_arrow),
          label: const Text('Play'),
        ),
        const SizedBox(width: 10),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.black),
          ),
          onPressed: () => _player.pause(),
          icon: const Icon(Icons.pause),
          label: const Text('Pause'),
        ),
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String assetPath;
  const VideoPlayerWidget({required this.assetPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        setState(() {
          _chewieController = ChewieController(
            videoPlayerController: _controller,
            autoPlay: false,
            looping: true,
          );
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController != null
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Chewie(controller: _chewieController!),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
