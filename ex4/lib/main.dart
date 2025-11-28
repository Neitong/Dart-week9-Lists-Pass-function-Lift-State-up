// main.dart
import 'package:flutter/material.dart';
import 'joke.dart';

Color appColor = Colors.green[300] as Color;

void main() {
  runApp(const MaterialApp(
    home: JokeListScreen(),
  ));
}

class JokeListScreen extends StatefulWidget {
  const JokeListScreen({super.key});

  @override
  State<JokeListScreen> createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  // -1 means no joke is selected
  int _favoriteJokeIndex = -1;

  // This function updates the state when a card is clicked
  void setFavorite(int index) {
    setState(() {
      // If clicking the one already selected, deselect it. 
      // Otherwise, select the new one.
      if (_favoriteJokeIndex == index) {
        _favoriteJokeIndex = -1;
      } else {
        _favoriteJokeIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      // ListView.builder is better for performance with 20+ items
      body: ListView.builder(
        itemCount: myJokes.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            joke: myJokes[index],
            isFavorite: _favoriteJokeIndex == index, // Check if this specific row is the favorite
            onFavoriteClick: () {
              setFavorite(index);
            },
          );
        },
      ),
    );
  }
}

// Changed from StatefulWidget to StatelessWidget
// The Card doesn't decide if it's favorite anymore; the parent decides.
class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description)
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}