import 'package:flutter/material.dart';

import '../models/data.dart' as data;
import 'email_widget.dart';

class ReplyListView extends StatelessWidget {
  const ReplyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(data.replies.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),

            child: EmailWidget(
              email: data.replies[index],
            ),
          );
        }),
      ],
    );
  }
}