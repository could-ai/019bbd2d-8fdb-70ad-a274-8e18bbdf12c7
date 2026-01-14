import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Logo / Title
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0, left: 12),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.school, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  'Admissions.AI',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                ),
              ],
            ),
          ),

          // Navigation Items
          _NavItem(
            icon: Icons.chat_bubble_outline_rounded,
            label: 'AI Chat',
            isActive: true,
          ),
          _NavItem(icon: Icons.dashboard_outlined, label: 'Assistant Hub'),
          _NavItem(icon: Icons.folder_open_outlined, label: 'Projects'),
          _NavItem(icon: Icons.library_books_outlined, label: 'Library'),
          _NavItem(icon: Icons.history, label: 'History'),
          
          const Spacer(),
          
          const Divider(),
          const SizedBox(height: 16),
          _NavItem(icon: Icons.settings_outlined, label: 'Settings'),
          const SizedBox(height: 8),
          _UserProfileItem(),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _NavItem({
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = isActive ? colorScheme.primary : colorScheme.secondary;
    final bgColor = isActive ? colorScheme.primary.withOpacity(0.08) : Colors.transparent;

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: textColor, size: 22),
        title: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 15,
          ),
        ),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onTap: () {},
      ),
    );
  }
}

class _UserProfileItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: const CircleAvatar(
        radius: 16,
        backgroundColor: Color(0xFFCBD5E1),
        child: Icon(Icons.person, size: 20, color: Colors.white),
      ),
      title: const Text(
        'Alex Student',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.more_horiz, size: 20, color: Colors.grey),
    );
  }
}
