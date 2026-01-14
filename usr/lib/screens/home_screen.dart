import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/sidebar.dart';
import 'package:couldai_user_app/widgets/chat_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using LayoutBuilder to handle responsive layout if needed in future
    // For now, we implement the requested Left Sidebar + Main Content layout
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar (Hidden on very small screens could be an enhancement, keeping visible for now as per design)
          // We can wrap this in a visibility widget based on width if we wanted mobile support later
          const SizedBox(
            width: 260,
            child: Sidebar(),
          ),
          // Vertical Divider
          const VerticalDivider(width: 1, thickness: 1),
          // Main Chat Area
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: const ChatView(),
            ),
          ),
        ],
      ),
    );
  }
}
