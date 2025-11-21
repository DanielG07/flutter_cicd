import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AireAppbar extends ConsumerWidget {
  final double expandedHeight;
  final IconButton? leading;
  final String title;
  final List<Widget>? actions;
  const AireAppbar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.expandedHeight = 80,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      floating: false,
      pinned: true,
      backgroundColor: const Color(0xFFB8D8D8),
      elevation: 0,
      leading: leading,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontSize: leading != null ? 20 : 24,
            fontWeight: leading != null ? FontWeight.w600 : FontWeight.bold,
          ),
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 16),
      ),
      actions: actions,
    );
  }
}
