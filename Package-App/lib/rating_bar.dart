import 'package:assignment_1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarPage extends StatelessWidget {
  const RatingBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Rating Bar Page",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white70,
            iconSize: 25,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
          ),
          backgroundColor: Colors.indigo,
        ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            starRate(),
            customIconRate(),
            imageRate(),
          ],
        ),
      ),
    );
  }

  starRate() {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 5),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) => debugPrint(rating.toString()),
    );
  }

  customIconRate() {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 1,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 5),
      itemBuilder: ((context, index) {
        switch (index) {
          case 0:
            return const Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.red,
            );
          case 1:
            return const Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.red,
            );
          case 2:
            return const Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
            );
          case 3:
            return const Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
            );
          case 4:
            return const Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
            );
          default:
            return const Icon(Icons.sentiment_neutral);
        }
      }),
      onRatingUpdate: (rating) => debugPrint(rating.toString()),
    );
  }

  imageRate() {
    return RatingBar(
      initialRating: 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 5),
      ratingWidget: RatingWidget(
        full: image('assets/heart.png'),
        half: image('assets/heart_half.png'),
        empty: image('assets/heart_border.png'),
      ),
      onRatingUpdate: (rating) => debugPrint(rating.toString()),
    );
  }

  Widget image(String asset) {
    return Image.asset(
      asset,
      height: 25,
      width: 25,
      color: Colors.amber,
    );
  }
}