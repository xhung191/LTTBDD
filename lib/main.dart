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
      title: 'Profile',
      theme: ThemeData(useMaterial3: true),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Nút vuông bo góc dùng chung cho nút back và nút edit
  Widget _squareButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(icon, size: 20, color: color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: SafeArea(
        child: Stack(
          children: [
            // Hàng nút phía trên
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _squareButton(
                    icon: Icons.arrow_back,
                    color: Colors.black87,
                    onTap: () {},
                  ),
                  _squareButton(
                    icon: Icons.edit_note,
                    color: Colors.teal,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Avatar + tên + MSSV ở giữa màn hình
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 140,
                      height: 140,
                      child: Image.asset(
                        'assets/avatar.jpg',
                        fit: BoxFit.cover,
                        // Nếu chưa có ảnh thì hiện icon thay thế
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color.fromARGB(255, 112, 124, 134),
                          child: const Icon(Icons.person,
                              size: 80, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Hồ Xuân Hùng',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '056206006655',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}