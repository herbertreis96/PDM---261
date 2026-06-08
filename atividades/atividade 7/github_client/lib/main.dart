import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:window_to_front/window_to_front.dart';

import 'github_oauth_credentials.dart';
import 'src/github_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Client',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'GitHub Client',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return GithubLoginWidget(
      githubClientId: githubClientId,
      githubClientSecret: githubClientSecret,
      githubScopes: githubScopes,
      builder: (context, httpClient) {
        WindowToFront.activate();

        final accessToken = httpClient.credentials.accessToken;

        final gitHub = GitHub(
          auth: Authentication.withToken(accessToken),
        );

        return FutureBuilder<CurrentUser>(
          future: gitHub.users.getCurrentUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.hasError) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('GitHub Client'),
                ),
                body: Center(
                  child: Text(
                    'Erro: ${snapshot.error}',
                  ),
                ),
              );
            }

            if (!snapshot.hasData) {
              return const Scaffold(
                body: Center(
                  child: Text(
                    'Nenhum dado encontrado.',
                  ),
                ),
              );
            }

            final user = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                title: Text(title),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bem-vindo ${user.login}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Nome: ${user.name ?? "Não informado"}',
                    ),
                    Text(
                      'Login: ${user.login}',
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}