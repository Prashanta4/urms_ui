import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(child: Icon(Icons.person)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/create-post');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Write something...',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Dummy data count
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(child: Icon(Icons.person)),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Student Name',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '2 hours ago',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'This is a sample post content. It can contain text, images, and other attachments.',
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            GestureDetector(
                              onTapDown: (details) {
                                final RenderBox button =
                                    context.findRenderObject() as RenderBox;
                                final Offset localPosition = button
                                    .localToGlobal(Offset.zero);

                                showMenu(
                                  context: context,
                                  position: RelativeRect.fromLTRB(
                                    localPosition.dx,
                                    localPosition.dy - 200,
                                    localPosition.dx + 300,
                                    localPosition.dy,
                                  ),
                                  items: [
                                    PopupMenuItem(
                                      padding: EdgeInsets.zero,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          _buildReactionButton(
                                            context,
                                            '👍',
                                            'Like',
                                          ),
                                          _buildReactionButton(
                                            context,
                                            '❤️',
                                            'Love',
                                          ),
                                          _buildReactionButton(
                                            context,
                                            '😆',
                                            'Haha',
                                          ),
                                          _buildReactionButton(
                                            context,
                                            '😮',
                                            'Wow',
                                          ),
                                          _buildReactionButton(
                                            context,
                                            '😢',
                                            'Sad',
                                          ),
                                          _buildReactionButton(
                                            context,
                                            '😠',
                                            'Angry',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      '👍',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text('Like'),
                                    const SizedBox(width: 4),
                                    Text(
                                      '24',
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReactionButton(
    BuildContext context,
    String emoji,
    String label,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        // TODO: Implement reaction logic
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
