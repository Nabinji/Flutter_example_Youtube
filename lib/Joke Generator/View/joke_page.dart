import 'package:flutter/material.dart';
import 'package:flutter_example/Joke%20Generator/Provider%20Services/provider_services.dart';
import 'package:provider/provider.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Random Joke Gnerator"),
      ),
      body: Consumer<JokeProviderServices>(
        builder: (context, jokeController, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (jokeController.joke != null) ...[
                    Image.network(
                      jokeController.joke!.iconUrl,
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      jokeController.joke!.value,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        letterSpacing: 1
                      ),
                    ),
                     
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      jokeController.getData();
                    },
                    child: Text(
                      jokeController.joke == null
                          ? 'Start Reading Jokes'
                          : 'Next Joke',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
