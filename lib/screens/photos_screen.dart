import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/evidence.dart';
import '../providers/game_provider.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  static const Evidence jordanHoodieClue = Evidence(
    title: 'Jordan Wore the Red Hoodie',
    description:
        'A photo confirms that Jordan previously wore the red hoodie described by the eyewitness.',
    icon: Icons.person_search_outlined,
  );

  static const Evidence hoodieInSuvClue = Evidence(
    title: 'Red Hoodie in Diane’s SUV',
    description:
        'Ruby photographed the red hoodie in the back seat of Diane’s SUV after Jordan said he had returned it.',
    icon: Icons.directions_car_outlined,
  );

  static const Evidence pinecrestLocationClue = Evidence(
    title: 'Pinecrest Lake Location',
    description:
        'A photo saved on Ruby’s phone connects her final movements to the Pinecrest Lake and lake-house area.',
    icon: Icons.location_on_outlined,
  );

  static const List<_PhotoItem> photos = [
    _PhotoItem(
      title: 'Jordan in the red hoodie',
      date: 'Monday • 3:18 PM',
      caption:
          'A photo of Jordan wearing the red hoodie after practice. '
          'This makes him appear connected to the eyewitness description.',
      assetPath: 'lib/assets/images/jordan_evidence.png',
      clue: jordanHoodieClue,
      imageFit: BoxFit.cover,
    ),
    _PhotoItem(
      title: 'Back seat of Diane’s SUV',
      date: 'Monday • 6:04 PM',
      caption:
          'The same red hoodie appears in the back seat of Diane’s SUV. '
          'Ruby took this photo after Jordan said he had returned it.',
      assetPath: 'lib/assets/images/car_evidence.png',
      clue: hoodieInSuvClue,
      imageFit: BoxFit.cover,
    ),
    _PhotoItem(
      title: 'Pinecrest Lake area',
      date: 'Tuesday • 8:56 PM',
      caption:
          'A photo taken near Pinecrest Lake shortly before Ruby disappeared. '
          'The Beck family lake house is located nearby.',
      assetPath: 'lib/assets/images/pinecrest_lake.png',
      clue: pinecrestLocationClue,
      imageFit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Photos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
              decoration: const BoxDecoration(
                color: Color(0xFF11141B),
                border: Border(bottom: BorderSide(color: Colors.white12)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ruby’s Photos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Images recovered from Ruby’s phone',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 13,
                  childAspectRatio: 0.72,
                ),
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  final photo = photos[index];

                  return _PhotoCard(
                    photo: photo,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => _PhotoDetailScreen(photo: photo),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhotoCard extends StatelessWidget {
  final _PhotoItem photo;
  final VoidCallback onTap;

  const _PhotoCard({required this.photo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF171B24),
      borderRadius: BorderRadius.circular(17),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Colors.redAccent.withValues(alpha: 0.30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      photo.assetPath,
                      fit: photo.imageFit,
                      errorBuilder: (context, error, stackTrace) {
                        return const ColoredBox(
                          color: Color(0xFF0E1118),
                          child: Center(
                            child: Icon(
                              Icons.broken_image_outlined,
                              color: Colors.redAccent,
                              size: 48,
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 9,
                      right: 9,
                      child: Container(
                        width: 31,
                        height: 31,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.72),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.redAccent.withValues(alpha: 0.60),
                          ),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.redAccent,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                color: const Color(0xFF171B24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      photo.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      photo.date,
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhotoDetailScreen extends StatefulWidget {
  final _PhotoItem photo;

  const _PhotoDetailScreen({required this.photo});

  @override
  State<_PhotoDetailScreen> createState() {
    return _PhotoDetailScreenState();
  }
}

class _PhotoDetailScreenState extends State<_PhotoDetailScreen> {
  bool clueRecorded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (clueRecorded) {
      return;
    }

    clueRecorded = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      final gameProvider = context.read<GameProvider>();

      final alreadyDiscovered = gameProvider.state.discoveredClues.any(
        (clue) => clue.title == widget.photo.clue.title,
      );

      gameProvider.discoverClue(widget.photo.clue);

      if (!alreadyDiscovered) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Evidence added: ${widget.photo.clue.title}'),
            backgroundColor: const Color(0xFF2A2F38),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Photo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 650),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 430,
                    decoration: BoxDecoration(
                      color: const Color(0xFF11141B),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.redAccent.withValues(alpha: 0.35),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: InteractiveViewer(
                      minScale: 1,
                      maxScale: 4,
                      child: Image.asset(
                        widget.photo.assetPath,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.broken_image_outlined,
                                  color: Colors.redAccent,
                                  size: 75,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Image could not be loaded',
                                  style: TextStyle(color: Colors.white54),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    widget.photo.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    widget.photo.date,
                    style: const TextStyle(color: Colors.white38, fontSize: 13),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    widget.photo.caption,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.redAccent.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.manage_search,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(width: 11),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'EVIDENCE RECORDED',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                widget.photo.clue.description,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PhotoItem {
  final String title;
  final String date;
  final String caption;
  final String assetPath;
  final Evidence clue;
  final BoxFit imageFit;

  const _PhotoItem({
    required this.title,
    required this.date,
    required this.caption,
    required this.assetPath,
    required this.clue,
    this.imageFit = BoxFit.cover,
  });
}
