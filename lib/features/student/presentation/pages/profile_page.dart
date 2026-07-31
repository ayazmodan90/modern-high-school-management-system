import 'package:flutter/material.dart';

import '../widgets/profile_action_button.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const ProfileHeader(
              name: "Ayaz Modan",
              role: "Student",
            ),

            const SizedBox(height: 20),

            const ProfileInfoTile(
              icon: Icons.email,
              title: "Email",
              value: "ayaz@gmail.com",
            ),

            const ProfileInfoTile(
              icon: Icons.phone,
              title: "Mobile",
              value: "+91 9876543210",
            ),

            const ProfileInfoTile(
              icon: Icons.cake,
              title: "Date of Birth",
              value: "01 January 2005",
            ),

            const ProfileInfoTile(
              icon: Icons.school,
              title: "Class",
              value: "10-A",
            ),

            const ProfileInfoTile(
              icon: Icons.badge,
              title: "Roll Number",
              value: "25",
            ),

            const ProfileInfoTile(
              icon: Icons.man,
              title: "Father's Name",
              value: "Mr. Modan",
            ),

            const ProfileInfoTile(
              icon: Icons.woman,
              title: "Mother's Name",
              value: "Mrs. Modan",
            ),

            const ProfileInfoTile(
              icon: Icons.home,
              title: "Address",
              value: "Ahmedabad, Gujarat",
            ),

            const SizedBox(height: 25),

            ProfileActionButton(
              text: "Edit Profile",
              icon: Icons.edit,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Edit Profile feature coming soon...",
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}