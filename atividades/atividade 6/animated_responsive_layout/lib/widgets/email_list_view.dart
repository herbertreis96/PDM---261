import 'package:flutter/material.dart';

import '../models/data.dart';
import '../models/models.dart';
import 'star_button.dart';

class EmailListView extends StatelessWidget {
  const EmailListView({
    super.key,
    required this.currentUser,
    required this.selectedIndex,
    required this.onSelected,
  });

  final User currentUser;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: emails.length,

      itemBuilder: (context, index) {
        final email = emails[index];

        return InkWell(
          onTap: () => onSelected(index),

          child: Card(
            color: selectedIndex == index
                ? Theme.of(context)
                .colorScheme
                .primaryContainer
                : null,

            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),

            child: Padding(
              padding: const EdgeInsets.all(12),

              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                    AssetImage(email.sender.avatarUrl),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [
                        Text(
                          email.sender.name,

                          style: const TextStyle(
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        Text(email.subject),

                        const SizedBox(height: 4),

                        Text(
                          email.message,
                          maxLines: 2,
                          overflow:
                          TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      Text(email.time),

                      const SizedBox(height: 8),

                      const StarButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}