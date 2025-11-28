// jokes.dart
class Joke {
  final String title;
  final String description;

  Joke({required this.title, required this.description});
}

// A list of 20 generated jokes
List<Joke> myJokes = List.generate(
  20,
      (index) => Joke(
    title: 'Joke #${index + 1}',
    description: 'This is the description for joke number ${index + 1}. It is very funny!',
  ),
);