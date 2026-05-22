import 'models.dart';

const user_0 = User(
  name: 'Alex',
  avatarUrl: 'assets/avatar_1.png',
);

const user_1 = User(
  name: 'Maya',
  avatarUrl: 'assets/avatar_2.png',
);

const user_2 = User(
  name: 'John',
  avatarUrl: 'assets/avatar_3.png',
);

const user_3 = User(
  name: 'Emma',
  avatarUrl: 'assets/avatar_4.png',
);

const emails = [
  Email(
    sender: user_1,
    time: '2h ago',
    subject: 'Dinner Club',
    message:
    "I think it's time for us to finally try that new noodle shop downtown.",
  ),

  Email(
    sender: user_2,
    time: '5h ago',
    subject: 'Flutter Project',
    message:
    'The responsive layout is looking really good so far.',
  ),

  Email(
    sender: user_3,
    time: '1d ago',
    subject: 'Weekend Plans',
    message:
    'Anyone interested in hiking this weekend?',
  ),
];

const replies = [
  Email(
    sender: user_1,
    time: '1h ago',
    subject: 'Re: Dinner Club',
    message:
    'That noodle place sounds amazing. I am definitely in!',
  ),

  Email(
    sender: user_2,
    time: '45m ago',
    subject: 'Re: Dinner Club',
    message:
    'I heard the chef chooses the dishes randomly.',
  ),

  Email(
    sender: user_3,
    time: '30m ago',
    subject: 'Re: Dinner Club',
    message:
    'Count me in too!',
  ),
];