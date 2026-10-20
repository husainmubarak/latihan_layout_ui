import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Profile UI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const InstagramProfileScreen(),
    );
  }
}

class InstagramProfileScreen extends StatelessWidget {
  const InstagramProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'username_ulm',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.add_box_outlined), onPressed: () {}),
            IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          ],
        ),
        body: Column(
          children: [
            // 1. Bagian Foto Profil & Statistik
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn('67', 'Postingan'),
                        _buildStatColumn('758', 'Pengikut'),
                        _buildStatColumn('8', 'Mengikuti'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 2. Bagian Bio Teks
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Informatika ULM', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Lab Pemrograman Mobile'),
                  Text('linktr.ee/InformatikaULM', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 3. Tombol Aksi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Edit Profil'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Bagikan Profil'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 4. Tab Bar Navigasi
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.video_collection_outlined)),
                Tab(icon: Icon(Icons.person_pin_outlined)),
              ],
            ),

            // 5. Grid Postingan (TabBarView)
            Expanded(
              child: TabBarView(
                children: [
                  GridView.builder(
                    itemCount: 9,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.blue[(index % 8 + 1) * 100],
                        child: Center(
                          child: Text(
                            'Post ${index + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                  const Center(child: Text('Reels')),
                  const Center(child: Text('Tagged')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildStatColumn(String number, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}