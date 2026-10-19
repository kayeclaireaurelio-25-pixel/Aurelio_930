import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTab = 0;

  static const blue = Colors.pink;
  static const grey = Color(0xfff46294);

  final String coverUrl = 'https://share.google/pnG44nx72dS8m7K9G';

  final String avatarUrl = 'https://share.google/6JjZgFofTFjuyJ7CP';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCover(),
              buildProfileInfo(),
              buildButtons(),
              buildPrivacy(),
              buildTabs(),
              buildDetails(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCover() {
    return SizedBox(
      height: 205,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/cover.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFF26374A),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.12),
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: coverIcon(Icons.menu),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Row(
              children: [
                coverIcon(Icons.edit_outlined),
                const SizedBox(width: 10),
                coverIcon(Icons.search),
                const SizedBox(width: 10),
                coverIcon(Icons.more_horiz),
              ],
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: roundButton(Icons.camera_alt, 36),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1,
            child: Container(
              height: 16,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -38,
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 104,
                    height: 104,
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: grey,
                      backgroundImage: NetworkImage(avatarUrl),
                    ),
                  ),
                  Positioned(
                    right: -2,
                    bottom: 0,
                    child: roundButton(Icons.camera_alt, 32),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget coverIcon(IconData icon) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 21),
    );
  }

  Widget roundButton(IconData icon, double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: grey,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: size * 0.52,
        color: Colors.black87,
      ),
    );
  }

  Widget buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 42, 16, 0),
      child: Column(
        children: [
          const Text(
            'Kaye Claire',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            '3 posts',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 7),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 17),
              SizedBox(width: 3),
              Text(
                'Iloilo City',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 18, 14, 12),
      child: Row(
        children: [
          Expanded(
            child: actionButton(
              'Add to story',
              Icons.add_circle_outline,
              blue,
              Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: actionButton(
              'Edit profile',
              Icons.edit,
              const Color(0xFFE4E6EB),
              Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget actionButton(
    String label,
    IconData icon,
    Color background,
    Color foreground,
  ) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          backgroundColor: background,
          foregroundColor: foreground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 17),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPrivacy() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 17,
            backgroundColor: grey,
            child: Icon(Icons.lock, size: 18, color: Colors.black),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You locked your profile',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Learn more',
                style: TextStyle(color: blue, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTabs() {
    const labels = ['All', 'Photos', 'Reels'];

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE4E6EB)),
        ),
      ),
      child: Row(
        children: List.generate(labels.length, (index) {
          final selected = selectedTab == index;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                setState(() => selectedTab = index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color:
                      selected ? const Color(0xFFE7F3FF) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: selected ? blue : Colors.black87,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget buildDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Personal details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, size: 19),
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          const SizedBox(height: 4),
          detailRow(
            Icons.location_on_outlined,
            'Iloilo City, Philippines',
          ),
          detailRow(Icons.home_outlined, 'San Joaquin, Iloilo'),
          detailRow(Icons.cake_outlined, 'July 28, 2007'),
        ],
      ),
    );
  }

  Widget detailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          SizedBox(
            width: 28,
            child: Icon(icon, size: 22),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
