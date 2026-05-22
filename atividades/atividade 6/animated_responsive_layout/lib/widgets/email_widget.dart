import 'package:flutter/material.dart';

import '../models/models.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    super.key,
    required this.email,
    this.isPreview = true,
    this.isThreaded = false,
    this.showHeadline = false,
  });

  final Email email;
  final bool isPreview;
  final bool isThreaded;
  final bool showHeadline;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,

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
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        email.sender.name,

                        style: const TextStyle(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      Text(email.time),
                    ],
                  ),

                  const SizedBox(height: 4),

                  if (showHeadline)
                    Padding(
                      padding:
                          const EdgeInsets.only(
                        bottom: 6,
                      ),

                      child: Text(
                        email.subject,

                        style: const TextStyle(
                          fontWeight:
                              FontWeight.w700,

                          fontSize: 16,
                        ),
                      ),
                    ),

                  Text(
                    email.message,

                    maxLines:
                        isPreview ? 2 : null,

                    overflow: isPreview
                        ? TextOverflow.ellipsis
                        : null,
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
