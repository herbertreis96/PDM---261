import 'package:flutter/material.dart';

class Destination {
  const Destination({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}

const destinations = [
  Destination(
    label: 'Inbox',
    icon: Icons.inbox,
  ),

  Destination(
    label: 'Articles',
    icon: Icons.article,
  ),

  Destination(
    label: 'Chat',
    icon: Icons.chat,
  ),

  Destination(
    label: 'Video',
    icon: Icons.video_call,
  ),
];