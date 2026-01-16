import 'package:clean_architecture_with_bloc/domain/profile/entities/logged_in_user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileView extends StatelessWidget {
  final LoggedInUserEntity user;

  const ProfileView({required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Avatar
          CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.image)),

          const SizedBox(height: 12),

          // Name
          Text(
            "${user.firstName} ${user.lastName}",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          // Username
          Text("@${user.username}", style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 20),

          // Info cards
          _infoTile(Icons.email, "Email", user.email),
          _infoTile(Icons.phone, "Phone", user.phone),
          _infoTile(Icons.school, "University", user.university),
          _infoTile(Icons.badge, "Role", user.role),
          _infoTile(Icons.person, "Gender", user.gender),
          _infoTile(Icons.cake, "Age", user.age.toString()),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(label),
        subtitle: Text(value),
      ),
    );
  }
}
