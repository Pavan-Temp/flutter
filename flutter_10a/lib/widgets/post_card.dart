import 'package:flutter/material.dart';

/// A custom widget that displays a post with title and body content
/// Created as part of Flutter UI Component Testing experiment
class PostCard extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback? onTap;

  const PostCard({
    super.key,
    required this.title,
    required this.body,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
              Text(
                body,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  height: 1.4,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
