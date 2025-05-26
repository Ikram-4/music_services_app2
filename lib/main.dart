import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S.Rocks.Music',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MusicService> services = [
    MusicService(
      icon: Icons.music_note,
      title: 'Music Production',
      description: 'Custom Instrumentals & Film Scoring',
      color: Colors.orange,
    ),
    MusicService(
      icon: Icons.equalizer,
      title: 'Mixing & Mastering',
      description: 'Make Your Tracks Radio-ready',
      color: Colors.teal,
    ),
    MusicService(
      icon: Icons.edit,
      title: 'Lyrics Writing',
      description: 'Turn feelings into lyrics',
      color: Colors.amber,
    ),
    MusicService(
      icon: Icons.mic,
      title: 'Vocals',
      description: 'Vocals that bring your lyrics to life',
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar and Header
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFE91E63),
                    Color(0xFFAD1457),
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Status bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '9:41',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 16),
                          const SizedBox(width: 4),
                          Icon(Icons.wifi, color: Colors.white, size: 16),
                          const SizedBox(width: 4),
                          Icon(Icons.battery_full, color: Colors.white, size: 16),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Search bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white.withOpacity(0.7)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Search TUNEIN Live...',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Icon(Icons.mic, color: Colors.white.withOpacity(0.7)),
                        const SizedBox(width: 12),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          child: Icon(Icons.person, color: Colors.white, size: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Free Demo Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Claim your',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const Text(
                                'Free Demo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const Text(
                                'for custom Music Production',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFFE91E63),
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  'Book Now',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Piano keys decoration
                        Container(
                          width: 40,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CustomPaint(
                            painter: PianoKeysPainter(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Services Section
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hire hand-picked Pros for popular music services',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          return ServiceCard(service: services[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom Navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                border: Border(
                  top: BorderSide(color: Colors.grey.withOpacity(0.3)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NavItem(icon: Icons.home, label: 'Home', isActive: true),
                  NavItem(icon: Icons.newspaper, label: 'News', isActive: false),
                  NavItem(icon: Icons.music_note, label: 'TuneIn', isActive: false),
                  NavItem(icon: Icons.work, label: 'Projects', isActive: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final MusicService service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: service.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              service.icon,
              color: service.color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  service.description,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[600],
            size: 16,
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFFE91E63) : Colors.grey,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFFE91E63) : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class PianoKeysPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    // Draw white keys
    final keyWidth = size.width / 3;
    for (int i = 0; i < 3; i++) {
      canvas.drawRect(
        Rect.fromLTWH(i * keyWidth, 0, keyWidth - 1, size.height),
        paint,
      );
    }

    // Draw black keys
    paint.color = Colors.black.withOpacity(0.5);
    final blackKeyWidth = keyWidth * 0.6;
    final blackKeyHeight = size.height * 0.6;
    
    for (int i = 0; i < 2; i++) {
      canvas.drawRect(
        Rect.fromLTWH(
          (i + 1) * keyWidth - blackKeyWidth / 2,
          0,
          blackKeyWidth,
          blackKeyHeight,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MusicService {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  MusicService({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}